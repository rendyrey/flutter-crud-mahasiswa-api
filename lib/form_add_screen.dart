import 'dart:convert';
import 'dart:typed_data';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

import 'ApiService.dart';
import 'Mahasiswa.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  Mahasiswa mahasiswa;
  FormAddScreen({this.mahasiswa});
  
  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}


class _WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;

  _WatermarkPaint(this.price, this.watermark);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
  //  canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, Paint()..color = Colors.black12);
      var rect = Rect.fromLTWH(0, 0, size.width, size.height);
      final paint = Paint();
      paint.color = Colors.white;
    // draw the rectangle using the paint
    // canvas.drawRect(rect, Paint()..color = Colors.black12);
    canvas.drawRect(rect,paint);
  }

  @override
  bool shouldRepaint(_WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is _WatermarkPaint && runtimeType == other.runtimeType && price == other.price && watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}

class _FormAddScreenState extends State<FormAddScreen>{
  final _sign = GlobalKey<SignatureState>();
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNamaValid;
  bool _isFieldEmailValid;
  bool _isFieldNimValid;
  bool _isFieldJenisKelaminValid;
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNim = TextEditingController();
  TextEditingController _controllerJenisKelamin = TextEditingController();

  @override
  //untuk edit
  void initState(){
    if(widget.mahasiswa != null){
      _isFieldEmailValid = true;
      _controllerEmail.text = widget.mahasiswa.email;
      _isFieldNamaValid = true;
      _controllerNama.text = widget.mahasiswa.nama;
      _isFieldNimValid = true;
      _controllerNim.text = widget.mahasiswa.nim;
      _isFieldJenisKelaminValid = true;
      _controllerJenisKelamin.text = widget.mahasiswa.jenisKelamin;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key:_scaffoldState,
      appBar:AppBar(
        iconTheme:IconThemeData(color:Colors.white),
        title:Text(widget.mahasiswa == null ? "Form Add":"Change Data",style:TextStyle(color:Colors.white)),
      ),
      body:Stack(
        children: <Widget>[
          Padding(
            padding:const EdgeInsets.all(16),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
                _buildTextFieldNama(),
                _buildTextFieldEmail(),
                _buildTextFieldNim(),
                _buildTextFieldJenisKelamin(),
                Container(
                  child: Signature(
                  color: Colors.black,
                  key: _sign,
                  
                  onSign: () {
                    // final sign = _sign.currentState;
                    // debugPrint('${sign.points.length} points in the signature');
                  },
                 backgroundPainter: _WatermarkPaint("2.0", "2.0"),
                  strokeWidth: 4.0,
                ),
                  height: 120,
                ),
                MaterialButton(
                      color: Colors.red[200],
                      onPressed: () {
                        final sign = _sign.currentState;
                        sign.clear();
                        // setState(() {
                        //   _img = ByteData(0);
                        // });
                        debugPrint("cleared");
                      },
                      child: Text("Clear Signature")),
               
                Padding(
                  padding:const EdgeInsets.only(top:8),
                  child:RaisedButton(
                    onPressed:() async {
                      if(_isFieldNamaValid == null ||
                          _isFieldEmailValid == null ||
                          _isFieldNimValid == null ||
                          _isFieldJenisKelaminValid == null ||
                          !_isFieldNamaValid ||
                          !_isFieldEmailValid ||
                          !_isFieldNimValid ||
                          !_isFieldJenisKelaminValid){
                            messageBoxFailed("Please fill all the fields", "Failed!");
                            return;
                          }
                          setState(()=> _isLoading = true);
                          String nama = _controllerNama.text.toString();
                          String email = _controllerEmail.text.toString();
                          String nim = _controllerNim.text.toString();
                          String jenisKelamin = _controllerJenisKelamin.text.toString();
                          

                          //untuk image
                        //     final image = await _fbKey.currentState.fields["signature"].currentState.value.getData();

                        // var data = await image.toByteData(format: ui.ImageByteFormat.png);
                        // final encoded = base64.encode(data.buffer.asUint8List());
                        //   String ttd = encoded;
                        //   print(ttd);

                        //misalnya ini teh submit.
                        //di sini coba simpen ke gallery atau ke server, atau ke manapun pri. nanti diloadnya tinggal link
                        //image nya, misalnya simpen gambar/upload ke server, linknya di database.
                        //load image di sini.
                        final sign = _sign.currentState;
                        final image = await sign.getData();
                        var data = await image.toByteData(format: ui.ImageByteFormat.png);
                        final encoded = base64.encode(data.buffer.asUint8List());
                        // print(encoded);
                          Mahasiswa mahasiswa = Mahasiswa(nama:nama,email:email,nim:nim,jenisKelamin:jenisKelamin,ttd:encoded);
                          if(widget.mahasiswa == null){
                              _apiService.createMahasiswa(mahasiswa).then((isSuccess){
                              setState(()=> _isLoading = false);
                              if(isSuccess){
                                Navigator.pop(_scaffoldState.currentState.context);
                                messageBoxSuccess("Submit data success","Success!");
                              }else{
                                _scaffoldState.currentState.showSnackBar(
                                  SnackBar(content:Text("Submit data failed"),
                                  )
                                );
                              }
                            });
                          }else{
                            mahasiswa.id = widget.mahasiswa.id;
                            _apiService.updateMahasiswa(mahasiswa).then((isSuccess){
                              setState(()=>_isLoading = false);
                              if(isSuccess){
                                Navigator.pop(_scaffoldState.currentState.context);
                                messageBoxSuccess("Update data success", "Success!");
                              }else{
                                _scaffoldState.currentState.showSnackBar(
                                  SnackBar(
                                    content:Text("Update data failed"),
                                  )
                                );
                              }
                            });
                          }
                          
                    },
                    child:Text(
                      widget.mahasiswa == null ? "Submit".toUpperCase():"Update Data".toUpperCase(),
                      style:TextStyle(
                        color:Colors.white,
                      ),
                    ),
                    color:Colors.orange[500]
                  )
                )
              ]
            )
          ),
          _isLoading ? Stack(
            children: <Widget>[
              Opacity(
                opacity:0.4,
                child:ModalBarrier(
                  dismissible: false,
                  color:Colors.blue[200]
                )
              ),
              Center(
                child:CircularProgressIndicator()
              )
            ],
          ) : Container()
        ],
      )
    );
  }

  Widget _buildTextFieldNama() {
    return TextField(
      controller: _controllerNama,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
        errorText: _isFieldNamaValid == null || _isFieldNamaValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNamaValid) {
          setState(() => _isFieldNamaValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
      
    
    );
  }

  Widget _buildTextFieldNim() {
    return TextField(
      controller: _controllerNim,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "NIM",
        errorText: _isFieldNimValid == null || _isFieldNimValid
            ? null
            : "NIM is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNimValid) {
          setState(() => _isFieldNimValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldJenisKelamin() {
    return TextField(
      controller: _controllerJenisKelamin,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Jenis Kelamin",
        errorText: _isFieldJenisKelaminValid == null || _isFieldJenisKelaminValid
            ? null
            : "Age is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldJenisKelaminValid) {
          setState(() => _isFieldJenisKelaminValid = isFieldValid);
        }
      },
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
}