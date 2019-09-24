import 'dart:convert';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/cupertino.dart';


class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

   printThermal(String nim,String nama, String email, String jenisKelamin, String ttd) async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        bluetooth.printCustom(nama,3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom(email,2,1);
        bluetooth.printNewLine();
        bluetooth.printCustom(jenisKelamin,2,1);
        bluetooth.printNewLine();
        bluetooth.printImage(function(data){
          
        });
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
        // bluetooth.printNewLine();
        // bluetooth.printImage(Image.memory(base64Decode(mahasiswa.ttd)));
        // bluetooth.printNewLine();
        // bluetooth.printLeftRight("LEFT", "RIGHT",0);
        // bluetooth.printLeftRight("LEFT", "RIGHT",1);
        // bluetooth.printNewLine();
        // bluetooth.printLeftRight("LEFT", "RIGHT",2);
        // bluetooth.printCustom("Body left",1,0);
        // bluetooth.printCustom("Body right",0,2);
        // bluetooth.printNewLine();
        // bluetooth.printCustom("Terimakasih",2,1);
        // bluetooth.printNewLine();
        // bluetooth.printQRcode("Insert Your Own Text to Generate", 150, 150, 2);
      }
    });
  }
}