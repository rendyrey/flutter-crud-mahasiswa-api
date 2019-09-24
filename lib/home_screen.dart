import 'dart:convert';
import 'dart:typed_data';

import 'package:crud_mahasiswa/ApiService.dart';
import 'package:crud_mahasiswa/print.dart';
import 'package:crud_mahasiswa/printer.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'Mahasiswa.dart';
import 'form_add_screen.dart';

class HomeScreen extends StatefulWidget{
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen>{
  BuildContext context; //untuk delete
  ApiService apiService;

  //untuk edit
  @override
  void initState(){
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context){
    this.context = context; //untuk delete
    return Scaffold(
      key:_scaffoldState,
      appBar: AppBar(
        title:Text("Mahasiswa"),
        actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  _scaffoldState.currentContext,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FormAddScreen();
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
      ),
      body:Container(
      child:FutureBuilder(
        future:apiService.getMahasiswa(),
        builder:(BuildContext context,AsyncSnapshot<List<Mahasiswa>> snapshot){
          if(snapshot.hasError){
            return Center(
              child:Text("Something wrong with message:${snapshot.error.toString()}")
            );
          }else if(snapshot.connectionState == ConnectionState.done){
            List<Mahasiswa> mahasiswa = snapshot.data;
            return _buildListView(mahasiswa);
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }
        }
      )
    )
    );
  }

  Widget _buildListView(List<Mahasiswa> mahasiswas){

    ByteData _img = ByteData(0);
    
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child:ListView.builder(
        itemCount:mahasiswas.length,
        itemBuilder: (context,index){
          Mahasiswa mahasiswa = mahasiswas[index];
          return Padding(
            padding:const EdgeInsets.only(top:8),
            child:Card(
              child:Padding(
                padding:const EdgeInsets.all(16),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mahasiswa.nama,
                      style:Theme.of(context).textTheme.title
                    ),
                    Text(mahasiswa.email),
                    // Text(mahasiswa.nim),
                    LimitedBox(maxHeight: 100.0, child: Image.memory(base64Decode(mahasiswa.ttd))),
                    // Text(mahasiswa.jenis_kelamin),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed:(){
                            showDialog(
                              context:context,
                              builder:(context){
                                return AlertDialog(
                                  title:Text("Warning"),
                                  content:Text("Are you sure want to delete data mahasiswa ${mahasiswa.nama}?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child:Text("Yes"),
                                      onPressed:(){
                                        Navigator.pop(context);
                                        apiService.deleteMahasiswa(mahasiswa.id).then((isSuccess){
                                          if(isSuccess){
                                            setState((){});
                                            messageBoxSuccess("Delete data success","Success!");
                                            // Scaffold.of(this.context).showSnackBar(
                                            //   SnackBar(
                                            //     content:Text("Delete data success")
                                            //   )
                                            // );
                                          }else{
                                            // Scaffold.of(this.context).showSnackBar(
                                            //   SnackBar(
                                            //     content:Text("Delete data failed")
                                            //   )
                                            // );
                                            messageBoxFailed("Delete data failed","Failed!");
                                          }
                                        });
                                        
                                      }
                                    ),
                                    FlatButton(
                                      child:Text("No"),
                                      onPressed:(){
                                        Navigator.pop(context);
                                      }
                                    )
                                  ],
                                );
                              }
                            );
                          },
                          child:Text(
                            "Delete",
                            style:TextStyle(color:Colors.red[600]),
                          )
                        ),
                        FlatButton(
                          onPressed: (){
                             Navigator.push(
                              _scaffoldState.currentContext,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return FormAddScreen(mahasiswa:mahasiswa);
                              }),
                            );
                          },
                          child:Text(
                            "Edit",
                            style:TextStyle(color:Colors.blue[800])
                          )
                        ),
                        FlatButton(
                          onPressed: (){
                            //  _printPdf(mahasiswa);
                            Navigator.push(
                              _scaffoldState.currentContext,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Printer(mahasiswa:mahasiswa);
                              }),
                            );
                          },
                          child:Text(
                            "Print",
                            style:TextStyle(color:Colors.blue[800])
                          )
                        ),
                      ],
                    )
                  ],
                )
              )
            )
          );
        },
      )
    );
  }

  messageBoxSuccess(String message,String title){
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.green,
      backgroundGradient: LinearGradient(colors:[Colors.green,Colors.grey]),
      boxShadows: [BoxShadow(color: Colors.red[800], offset: Offset(0.0, 2.0), blurRadius: 3.0,)],
      duration:Duration(seconds:4)
    ).show(context);
  }

  messageBoxFailed(String message,String title){
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.red,
      backgroundGradient: LinearGradient(colors:[Colors.red,Colors.grey]),
      boxShadows: [BoxShadow(color: Colors.red[800], offset: Offset(0.0, 2.0), blurRadius: 3.0,)],
      duration:Duration(seconds:4)
    ).show(context);
  }

  Future<void> _printPdf(mahasiswa) async {
    print('Print ...');
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async =>
            (await generateDocument(format,mahasiswa)).save());
  }




}