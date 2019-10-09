import 'dart:convert';
import 'dart:typed_data';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';


class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

   printThermal(String nim,String nama, String email, String jenisKelamin, String ttd,String pathImage) async {
    
 
    //  Image image = decodeImage(base64Decode(ttd));
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    // bluetooth.isConnected.then((isConnected) {
    //   if (isConnected) {
    //     bluetooth.printCustom(nama,3,1);
    //     bluetooth.printNewLine();
    //     bluetooth.printCustom(email,2,1);
    //     bluetooth.printNewLine();
    //     bluetooth.printCustom(jenisKelamin,2,1);
    //     bluetooth.printNewLine();
    //     bluetooth.printImage(pathImage);
    //     bluetooth.printNewLine();
    //     bluetooth.printNewLine();
    //     bluetooth.paperCut();
    //     // bluetooth.printNewLine();
    //     // bluetooth.printImage(Image.memory(base64Decode(mahasiswa.ttd)));
    //     // bluetooth.printNewLine();
    //     // bluetooth.printLeftRight("LEFT", "RIGHT",0);
    //     // bluetooth.printLeftRight("LEFT", "RIGHT",1);
    //     // bluetooth.printNewLine();
    //     // bluetooth.printLeftRight("LEFT", "RIGHT",2);
    //     // bluetooth.printCustom("Body left",1,0);
    //     // bluetooth.printCustom("Body right",0,2);
    //     // bluetooth.printNewLine();
    //     // bluetooth.printCustom("Terimakasih",2,1);
    //     // bluetooth.printNewLine();
    //     // bluetooth.printQRcode("Insert Your Own Text to Generate", 150, 150, 2);
    //   }
    // });

    String printSpace(String string1, String string2){
      String whitespace = '';
      int spasi = 63 - (string1.length + string2.length);
      for(int i=0;i<=spasi;i++){
        whitespace += ' ';
      }
      return whitespace;
    }
    String pt = "PT SARANA KENCANA MULYA";
    // kode barang nama barang
    // 1 x 500.000 Disc 10%    450.000
    String barang1 = "WA-137017-00A PEMAKAIAN KOMPONEN";
    String harga1 = "1 X 600.000 DISC 25%";
    String total1 = "487.500";
    
    String barang2 = "EG-300089-ATA FRONT REINFORCEMENT RH REF 50";
    String harga2 = "2 X 400.000 DISC 30%";
    String total2 = "210.000";
    String barang3 = "TAPPING SCREW FOR GROUNDUC BTV 3X8";
    String barang4 = "BIAYA JASA SERVICE";
    String harga4 = "1 X 100.000 DISC 15%";
    String total4 = "85.000";
    bluetooth.isConnected.then((isConnected){
      if(isConnected){
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printCustom("PT SARANA KENCANA MULYA",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("RINCIAN BIAYA",3,1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("PEMBARAYAN: DEBIT","27/06/2020 15.10 WIB",0);
        bluetooth.printCustom("NOMOR: IS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printCustom("GARANSI: TIDAK GARANSI",0,2);
        bluetooth.printCustom("SERVICE TYPE: KL",0,2);
        bluetooth.printCustom("KELENGKAPAN: UNIT, RAK",0,1);
        bluetooth.printCustom("KERUSAKAN: TIDAK DINGIN",0,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("ID NPWP/KTP/PASPOR: 3315072201870000",0,0);
        bluetooth.printCustom("NAMA PEMILIK: DARMADI",0,0);
        bluetooth.printCustom("ALAMAT: JL. GLUNTUNGAN 3 NO 4 RT 02/04 BANJARSARI, KRADENAN GROBOGAN",0,0);
        bluetooth.printCustom("TELP: 0291-755282",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(barang1,0,0);

        bluetooth.printCustom(harga1+printSpace(harga1, total1)+total1,0,0);
        bluetooth.printCustom(harga2+printSpace(harga2,total2)+total2,0,0);
        // bluetooth.printCustom("FRONT REINFORCEMENT RH REF 50",0,0);
        // bluetooth.printCustom("EG-300089-ATA",0,0);
        // bluetooth.printCustom("DISC 30%    2    210,000",0,2);
        // bluetooth.printCustom("TAPPING SCREW FOR GROUNDUC BTV 3X8",0,0);
        // bluetooth.printCustom("BIAYA JASA SERVICE",0,0);
        // bluetooth.printCustom("DISC 15%          85,000",0,2);
        // bluetooth.printCustom("TOTAL BIAYA SERVICE",0,0);
        // bluetooth.printCustom("782,500",0,2);
        // bluetooth.printCustom("PPN",0,0);
        // bluetooth.printCustom("78,250",0,2);
        // bluetooth.printCustom("TOTAL BIAYA SERVICE SETELAH PPN",0,0);
        // bluetooth.printCustom("860,750",0,2);
        // bluetooth.printCustom("TERBILANG: DELAPAN RATUS ENAM PULUH RIBU TUJUH RATUS LIMA PULUH RUPIAH",0,0);
        // bluetooth.printNewLine();
        // bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        // bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        // bluetooth.printCustom("PENERIMA:",0,2);
        // bluetooth.printCustom("TTD KONSUMEN",0,2);
        // bluetooth.printNewLine();
        // bluetooth.printCustom("Lembar ini sebagai bukti garansi jasa service dan komponen sejenis dengan diagram yang sama yang diganti, selama 60 hari terhitung dari tanggal pengambilan/pengiriman",0,1);
        // bluetooth.printNewLine();
        // bluetooth.printCustom("ASLI/REPRINT 1/REPRINT 2",3,1);
        // bluetooth.printNewLine();
        // bluetooth.printNewLine();
        // bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        // bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        // bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        // bluetooth.printCustom("NO SERI:25B00478",0,0);
        // bluetooth.printCustom("RINCIAN YNAG HARUS DIBAYAR:",0,0);
        // bluetooth.printCustom("TOTAL BIAYA SERVICE SETELAH PPN",0,0);
        // bluetooth.printCustom("860,750",0,2);
        // bluetooth.printCustom("UANG TITIPAN 20/06/19",0,0);
        // bluetooth.printCustom("(200,000)",0,2);
        // bluetooth.printCustom("UANG TITIPAN 25/06/19",0,0);
        // bluetooth.printCustom("(100,000)",0,2);
        // bluetooth.printCustom("TOTAL BIAYA YANG HARUS DIBAYAR",0, 0);
        // bluetooth.printCustom("560,750",0,2);
        // bluetooth.printCustom("TERBILANG: LIMA RATUS ENAM PULUH RIBU TUJUH RATUS LIMA PULUH RUPIAH",0,0);
        // bluetooth.printNewLine();
        // bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        // bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        // bluetooth.printCustom("PENERIMA",0,2);
        // bluetooth.printCustom("TTD KONSUMEN",0,2);
        bluetooth.paperCut();
      }

      
    });
  }
}