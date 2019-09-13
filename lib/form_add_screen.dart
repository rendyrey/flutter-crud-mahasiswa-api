import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ApiService.dart';
import 'Mahasiswa.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  Mahasiswa mahasiswa;
  FormAddScreen({this.mahasiswa});
  
  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen>{
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
                Padding(
                  padding:const EdgeInsets.only(top:8),
                  child:RaisedButton(
                    onPressed:(){
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

                          Mahasiswa mahasiswa = Mahasiswa(nama:nama,email:email,nim:nim,jenisKelamin:jenisKelamin);
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
                                messageBoxSuccess("Update data success", "Success!");
                                Navigator.pop(_scaffoldState.currentState.context);
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