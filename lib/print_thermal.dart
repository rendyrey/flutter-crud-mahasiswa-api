import 'dart:convert';
import 'dart:typed_data';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';


class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

   printThermal(String nim,String nama, String email, String jenisKelamin, String ttd,String pathImage,String pathImageTtd) async {
    
 
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


  // ================================================= print spasi ========================================= //
    // String printSpace(String string1, String string2){
    //   String whitespace = '';
    //   int spasi = 63 - (string1.length + string2.length);
    //   for(int i=0;i<=spasi;i++){
    //     whitespace += ' ';
    //   }
    //   return whitespace;
    // }
    // String pt = "PT SARANA KENCANA MULYA";
    // // kode barang nama barang
    // // 1 x 500.000 Disc 10%    450.000
    // String barang1 = "WA-137017-00A PEMAKAIAN KOMPONEN";
    // String harga1 = "1 X 600.000 DISC 25%";
    // String total1 = "487.500";
    
    // String barang2 = "EG-300089-ATA FRONT REINFORCEMENT RH REF 50";
    // String harga2 = "2 X 400.000 DISC 30%";
    // String total2 = "210.000";
    // String barang3 = "TAPPING SCREW FOR GROUNDUC BTV 3X8";
    // String barang4 = "BIAYA JASA SERVICE";
    // String harga4 = "1 X 100.000 DISC 15%";
    // String total4 = "85.000";
    // bluetooth.isConnected.then((isConnected){
    //   if(isConnected){
    //     bluetooth.printImage(pathImage);
    //     bluetooth.printNewLine();
    //     bluetooth.printCustom("PT SARANA KENCANA MULYA",3,1);
    //     bluetooth.printNewLine();
    //     bluetooth.printCustom("RINCIAN BIAYA",3,1);
    //     bluetooth.printNewLine();
    //     bluetooth.printLeftRight("PEMBARAYAN: DEBIT","27/06/2020 15.10 WIB",0);
    //     bluetooth.printCustom("NOMOR: IS-KDS-AG-200627001",0,0);
    //     bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
    //     bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
    //     bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
    //     bluetooth.printCustom("NO SERI:25B00478",0,0);
    //     bluetooth.printCustom("GARANSI: TIDAK GARANSI",0,2);
    //     bluetooth.printCustom("SERVICE TYPE: KL",0,2);
    //     bluetooth.printCustom("KELENGKAPAN: UNIT, RAK",0,1);
    //     bluetooth.printCustom("KERUSAKAN: TIDAK DINGIN",0,1);
    //     bluetooth.printNewLine();
    //     bluetooth.printCustom("ID NPWP/KTP/PASPOR: 3315072201870000",0,0);
    //     bluetooth.printCustom("NAMA PEMILIK: DARMADI",0,0);
    //     bluetooth.printCustom("ALAMAT: JL. GLUNTUNGAN 3 NO 4 RT 02/04 BANJARSARI, KRADENAN GROBOGAN",0,0);
    //     bluetooth.printCustom("TELP: 0291-755282",0,0);
    //     bluetooth.printNewLine();
    //     bluetooth.printCustom(barang1,0,0);

    //     bluetooth.printCustom(harga1+printSpace(harga1, total1)+total1,0,0);
    //     bluetooth.printCustom(harga2+printSpace(harga2,total2)+total2,0,0);
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
        // bluetooth.paperCut();
      // }

      
    // });




    
  }

  printServiceKittir(String nim,String nama, String email, String jenisKelamin, String ttd,String pathImage,String pathImageTtd) async {
    // ======================================= print contoh faktur ======================================== //
    String term1_0 = "1. Garansi diberikan apabila produk disertai kartu garansi dan ";
    String term1_1 = "   bukti pembelian yang asli, sah dan benar";
    String term2_0 = "2. Untuk produk yang masih garansi jual, ";
    String term2_1 = "   masa berlaku s/d....";
    String term3_0 = "3. Untuk produk tidak garansi atau bekas perbaikan di luar";
    String term3_1 = "   service center resmi PT.SKM; karena memiliki risiko reparasi";
    String term3_2 = "   yang besar maka konsekuensi adanya risiko reparasi dan tidak";
    String term3_3 = "   akan mengajukan keberatan di kemudian hari. risiko reparasi";
    String term3_4 = "   antara lain: produk tidak bisa diperbaiki, adanya kerusakan";
    String term3_5 = "   tambahan, dll.";
    String term4_0 = "4. Kami tidak bertanggung jawab terhadap kehilangan/kerusakan"; 
    String term4_1 = "   data di dalam memori produk. konsumen harus mem-backup";
    String term4_2 = "   datanya sebelum diperbaiki.";
    String term5_0 = "5. Adanya perubahan status garansi menjadi tidak garansi,";
    String term5_1 = "   apabila ditemukan kesalahan garansi setelah produk";
    String term5_2 = "   diperiksa lebih lanjut.";
    String term6_0 = "6. Kondisi produk dan kelengkapannya";
    String term7_0 = "7. Saat mengambil barang, konsumen harus menunjukkan tanda"; 
    String term7_1 = "   identitas (npwp/ktp/paspor) dan tanda terima resmi PT.SKM";
    String term8_0 = "8. Kami tidak bertanggung jawab atas produk dan jaminan yang"; 
    String term8_1 = "   lebih dari 3 (tiga) bulan tidak diurus/diambil oleh konsumen";
    String term9_0 = "9. Dengan mendantangai tanda terima ini, berarti konsumen telah";
    String term9_1 = "   menyetujui persyaratan perbaikan sesuai kartu garansi dan";
    String term9_2 = "   ketentuan layanan service PT.SKM";
    bluetooth.isConnected.then((isConnected){
      if(isConnected){
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printCustom("PT SARANA KENCANA MULYA",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("SERVICE TICKET",3,1);
        bluetooth.printCustom("27/06/2020 15:10 WIB",0,2);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printCustom("GARANSI: TIDAK GARANSI",0,2);
        bluetooth.printCustom("SERVICE TYPE: KL",0,2);
        bluetooth.printCustom("KELENGKAPAN: UNIT, RAK",0,0);
        bluetooth.printCustom("KERUSAKAN: TIDAK DINGIN",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("ID NPWP/KTP/PASPOR: 3315072201870000",0,0);
        bluetooth.printCustom("NAMA PEMILIK: DARMADI",0,0);
        bluetooth.printCustom("ALAMAT: JL. GLUNTUNGAN 3 NO 4 RT 02/04 BANJARSARI, KRADENAN GROBOGAN",0,0);
        bluetooth.printCustom("TELP: 0291-755282",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("HAL-HAL YANG SUDAH DISETUJUI SEBAGAI SYARAT PERBAIKAN:",0,0);
        bluetooth.printCustom(term1_0,0,0);        
        bluetooth.printCustom(term1_1,0,0);
        bluetooth.printCustom(term2_0,0,0);
        bluetooth.printCustom(term2_1,0,0);
        bluetooth.printCustom(term3_0,0,0);
        bluetooth.printCustom(term3_1,0,0);
        bluetooth.printCustom(term3_2,0,0);
        bluetooth.printCustom(term3_3,0,0);
        bluetooth.printCustom(term3_4,0,0);
        bluetooth.printCustom(term3_5,0,0);
        bluetooth.printCustom(term4_0,0,0);
        bluetooth.printCustom(term4_1,0,0);
        bluetooth.printCustom(term4_2,0,0);
        bluetooth.printCustom(term5_0,0,0);
        bluetooth.printCustom(term5_1,0,0);
        bluetooth.printCustom(term5_2,0,0);
        bluetooth.printCustom(term6_0,0,0);
        bluetooth.printCustom(term7_0,0,0);
        bluetooth.printCustom(term7_1,0,0);
        bluetooth.printCustom(term8_0,0,0);
        bluetooth.printCustom(term8_1,0,0);
        bluetooth.printCustom(term9_0,0,0);
        bluetooth.printCustom(term9_1,0,0);
        bluetooth.printCustom(term9_2,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("ASLI/REPRINT 1/REPRINT 2",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("KITTIR",3,1);
        bluetooth.printCustom("27/06/2020 15:10",0,0);
        bluetooth.printCustom("CASE    : CS-KDS-AG-200627001",2,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",2,0);
        bluetooth.printCustom("TIPE    : PRZ 211BW",2,0);
        bluetooth.printCustom("NO SERI : 25B00478",2,0);
        bluetooth.paperCut();
      }
    });
  }

  printInvoiceNettingJaminan(String nim,String nama, String email, String jenisKelamin, String ttd,String pathImage,String pathImageTtd) async {
    // ======================================= print contoh faktur ======================================== //
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
    String totalService = "782.500";
    String ppn = "78.250";
    String totalPpn = "860,750";
    String terbilang = "TERBILANG: DELAPAN RATUS ENAM PULUH RIBU TUJUH RATUS LIMA PULUH RUPIAH";
    bluetooth.isConnected.then((isConnected){
      if(isConnected){
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printCustom("PT SARANA KENCANA MULYA",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("RINCIAN BIAYA",3,1);
        bluetooth.printCustom("27/06/2020 15:10 WIB",0,2);
        bluetooth.printCustom("NOMOR: IS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printCustom("GARANSI: TIDAK GARANSI",0,2);
        bluetooth.printCustom("SERVICE TYPE: KL",0,2);
        bluetooth.printCustom("KELENGKAPAN: UNIT, RAK",0,0);
        bluetooth.printCustom("KERUSAKAN: TIDAK DINGIN",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("ID NPWP/KTP/PASPOR: 3315072201870000",0,0);
        bluetooth.printCustom("NAMA PEMILIK: DARMADI",0,0);
        bluetooth.printCustom("ALAMAT: JL. GLUNTUNGAN 3 NO 4 RT 02/04 BANJARSARI, KRADENAN GROBOGAN",0,0);
        bluetooth.printCustom("TELP: 0291-755282",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(barang1,0,0);
        bluetooth.printCustom(harga1+printSpace(harga1,total1)+total1,0,0);
        bluetooth.printCustom(barang2,0,0);
        bluetooth.printCustom(harga2+printSpace(harga2,total2)+total2,0,0);
        bluetooth.printCustom(barang4,0,0);
        bluetooth.printCustom(harga4+printSpace(harga4,total4)+total4,0,0);
        bluetooth.printCustom("TOTAL BIAYA SERVICE"+printSpace("TOTAL BIAYA SERVICE",totalService)+totalService,0,0);
        bluetooth.printCustom("PPN"+printSpace("PPN",ppn)+ppn,0,0);
        bluetooth.printCustom("TOTAL BIAYA SERVICE SETELAH PPN"+printSpace("TOTAL BIAYA SERVICE SETELAH PPN",totalPpn)+totalPpn,0,0);
        bluetooth.printCustom(terbilang,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        bluetooth.printCustom("PENERIMA:",0,2);
        bluetooth.printCustom("TTD KONSUMEN",0,2);
        bluetooth.printNewLine();
        bluetooth.printCustom("Lembar ini sebagai bukti garansi jasa service dan komponen sejenis dengan diagram yang sama yang diganti selama 60 hari terhitung dari tanggal pengambilan/pengiriman",0,0);
        bluetooth.printCustom("ASLI/REPRINT 1/REPRINT 2",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printCustom("RINCIAN BIAYA YANG HARUS DIBAYAR:",0,0);
        bluetooth.printCustom("TOTAL BIAYA SERVICE SETELAH PPN"+printSpace("TOTAL BIAYA SERVICE SETELAH PPN","860.750")+"860.750",0,0);
        bluetooth.printCustom("UANG TITIPAN 20/06/19"+printSpace("UANG TITIPAN 20/06/19","(200.000)")+"(200.000)",0,0);
        bluetooth.printCustom("UANG TITIPAN 25/06/19"+printSpace("UANG TITIPAN 25/06/19","(100.000)")+"(100.000)",0,0);
        bluetooth.printCustom("TOTAL YANG HARUS DIBAYAR"+printSpace("TOTAL YANG HARUS DIBAYAR","560.750")+"560.750",0,0);
        bluetooth.printCustom("TERBILANG: LIMA RATUS ENAM PULUH RIBU TUJUH RATUS LIMA PULUH RUPIAH",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        bluetooth.printCustom("PENERIMA:",0,2);
        bluetooth.printCustom("TTD KONSUMEN",0,2);
        bluetooth.paperCut();
      }
    });
  }

  printNotaSukuCadang(String nim,String nama, String email, String jenisKelamin, String ttd,String pathImage,String pathImageTtd) async {
    
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
    String barang2 = "EG-300089-ATA FRONT REINFORCEMENT RH REF 50";
    String harga2 = "2 X 400.000 DISC 30%";
    String barang4 = "BIAYA JASA SERVICE";
    String harga4 = "1 X 100.000 DISC 15%";
    String ppn = "78.250";
    String totalPpn = "860,750";
    String terbilang = "TERBILANG: DELAPAN RATUS ENAM PULUH RIBU TUJUH RATUS LIMA PULUH RUPIAH";
    bluetooth.isConnected.then((isConnected){
      if(isConnected){
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printCustom("PT SARANA KENCANA MULYA",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("RINCIAN PENGGANTIAN KOMPONEN GARANSI",2,1);
        bluetooth.printCustom("27/06/2020 15:10 WIB",0,2);
        bluetooth.printCustom("NOMOR: IS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printCustom("GARANSI: GARANSI JUAL",0,2);
        bluetooth.printCustom("SERVICE TYPE: KL",0,2);
        bluetooth.printCustom("KELENGKAPAN: UNIT, RAK",0,0);
        bluetooth.printCustom("KERUSAKAN: TIDAK DINGIN",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("ID NPWP/KTP/PASPOR: 3315072201870000",0,0);
        bluetooth.printCustom("NAMA PEMILIK: DARMADI",0,0);
        bluetooth.printCustom("ALAMAT: JL. GLUNTUNGAN 3 NO 4 RT 02/04 BANJARSARI, KRADENAN GROBOGAN",0,0);
        bluetooth.printCustom("TELP: 0291-755282",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(barang1,0,0);
        bluetooth.printCustom(harga1+printSpace(harga1,"0")+"0",0,0);
        bluetooth.printCustom(barang2,0,0);
        bluetooth.printCustom(harga2+printSpace(harga2,"0")+"0",0,0);
        bluetooth.printCustom(barang4,0,0);
        bluetooth.printCustom(harga4+printSpace(harga4,"0")+"0",0,0);
        bluetooth.printCustom("TOTAL BIAYA SERVICE"+printSpace("TOTAL BIAYA SERVICE","0")+"0",0,0);
        bluetooth.printCustom("PPN"+printSpace("PPN",ppn)+ppn,0,0);
        bluetooth.printCustom("TOTAL BIAYA SERVICE SETELAH PPN"+printSpace("TOTAL BIAYA SERVICE SETELAH PPN",totalPpn)+totalPpn,0,0);
        bluetooth.printCustom(terbilang,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        bluetooth.printCustom("PENERIMA:",0,2);
        bluetooth.printCustom("TTD KONSUMEN",0,2);
        bluetooth.printNewLine();
        bluetooth.printCustom("ASLI/REPRINT 1/REPRINT 2",3,1);
        bluetooth.paperCut();
      }
    });
  }

  printTandaTerimaJaminan(String nim,String nama, String email, String jenisKelamin, String ttd,String pathImage,String pathImageTtd) async {
    
    bluetooth.isConnected.then((isConnected){
      if(isConnected){
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printCustom("PT SARANA KENCANA MULYA",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("TANDA TERIMA JAMINAN",3,1);
        bluetooth.printCustom("27/06/2020 15:10 WIB",0,2);
        bluetooth.printCustom("NOMOR: IS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("JUMLAH: RP 200.000",0,0);
        bluetooth.printCustom("TERBILANG: DUA RATUS RIBU RUPIAH",0,0);
        bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        bluetooth.paperCut();
      }
    });
  }


  
}