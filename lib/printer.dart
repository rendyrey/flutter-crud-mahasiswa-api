import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
// import 'package:blue_thermal_printer_example/testprint.dart';
import 'package:crud_mahasiswa/print_thermal.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'Mahasiswa.dart';

void main() => runApp(new Printer());



class Printer extends StatefulWidget {
  Mahasiswa mahasiswa;
  Printer({this.mahasiswa});
  @override
  PrinterState createState() => new PrinterState();
}

class PrinterState extends State<Printer> {

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  bool _pressed = false;
  String pathImage;
  TestPrint testPrint;
  Mahasiswa mhstemp;
  String nama;
  String email;
  String nim;
  String jenisKelamin;
  String ttd;
  @override
  void initState() {
    if( widget.mahasiswa != null){
      nama = widget.mahasiswa.nama;
      email = widget.mahasiswa.email;
      nim = widget.mahasiswa.nim;
      jenisKelamin = widget.mahasiswa.jenisKelamin;
      ttd = widget.mahasiswa.ttd;
      // mhstemp.email = widget.mahasiswa.email;
      // mhstemp.nama = widget.mahasiswa.nama;
      // mhstemp.nim = widget.mahasiswa.nim;
      // mhstemp.jenisKelamin = widget.mahasiswa.jenisKelamin;
      // mhstemp.ttd = widget.mahasiswa.ttd;
    }
    super.initState();
    initPlatformState();
    initSavetoPath();
    testPrint = TestPrint();
  }

 initSavetoPath()async{
    //read and write
    //image max 300px X 300px
    final filename = 'yourlogo.png';
    var bytes = await rootBundle.load("assets/images/polytron.jpg");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    setState(() {
     pathImage='$dir/$filename';
   });
 }




  Future<void> initPlatformState() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
            _pressed = false;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
            _pressed = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blue Thermal Printer'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Device:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton(
                      items: _getDeviceItems(),
                      onChanged: (value) => setState(() => _device = value),
                      value: _device,
                    ),
                    RaisedButton(
                      onPressed:
                      _pressed ? null : _connected ? _disconnect : _connect,
                      child: Text(_connected ? 'Disconnect' : 'Connect'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                child:  RaisedButton(
                  onPressed:(){
                    testPrint.printThermal(nim,nama,email,jenisKelamin,ttd,pathImage);
                  },
                  child: Text('Print '+nama),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }


  void _connect() {
    if (_device == null) {
      show('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(_device).catchError((error) {
            setState(() => _pressed = false);
          });
          setState(() => _pressed = true);
        }
      });
    }
  }


  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _pressed = true);
  }

//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

// testprint move to different class
 void _tesPrint() async {
//    //SIZE
//    // 0- normal size text
//    // 1- only bold text
//    // 2- bold with medium text
//    // 3- bold with large text
//    //ALIGN
//    // 0- ESC_ALIGN_LEFT
//    // 1- ESC_ALIGN_CENTER
//    // 2- ESC_ALIGN_RIGHT
   bluetooth.isConnected.then((isConnected) {
     if (isConnected) {
       bluetooth.printCustom("HEADER",3,1);
       bluetooth.printNewLine();
       bluetooth.printImage(pathImage);
       bluetooth.printNewLine();
       bluetooth.printCustom("Body left",1,0);
       bluetooth.printCustom("Body right",0,2);
       bluetooth.printNewLine();
       bluetooth.printCustom("Terimakasih",2,1);
       bluetooth.printNewLine();
      //  bluetooth.printQRcode('Insert Your Own Text to Generate');
       bluetooth.printNewLine();
       bluetooth.printNewLine();
       bluetooth.paperCut();
     }
   });
 }

  Future show(
      String message, {
        Duration duration: const Duration(seconds: 3),
      }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        duration: duration,
      ),
    );
  }
}
