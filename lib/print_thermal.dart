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
    String term1 = "1. GARANSI DIBERIKAN APABILA PRODUK DISERTAI KARTU GARANSI DAN BUKTI PEMBELIAN YANG ASLI, SAH DAN BENAR";
    String term2 = "2. UNTUK PRODUK YANG MASIH GARANSI JUAL, MASA BERLAKU S/D....";
    String term3 = "3. UNTUK PRODUK TIDAK GARANSI ATAU BEKAS PERBAIKAN DI LUAR SERVICE CENTER RESMI PT HIT; KARENA MEMILIKI RISIKO REPARASI YANG BESAR MAKA "+
    "KONSEKUENSI ADANYA RISIKO REPARASI DAN TIDAK AKAN MENGAJUKAN KEBERATAN DI KEMUDIAN HARI. RISIKO REPARASI ANTARA LAIN: PRODUK TIDAK BISA DIPERBAIKI, ADANYA KERUSAKAN TAMBAHAN, DLL.";
    String term4 = "4. KAMI TIDAK BERTANGGUNG JAWAB TERHADAP KEHILANGAN/KERUSAKAN DATA DI DALAM MEMORI PRODUK. KONSUMEN HARUS MEM-BACKUP DATANYA SEBELUM DIPERBAIKI.";
    String term5 = "5. ADANYA PERUBAHAN STATUS GARANSI MENJADI TIDAK GARANSI, APABILA DITEMUKAN KESALAHAN GARANSI SETELAH PRODUK DIPERIKSA LEBIH LANJUT.";
    String term6 = "6. KONDISI PRODUK DAN KELENGKAPANNYA";
    String term7 = "7. SAAT MENGAMBIL BARANG, KONSUMEN HARUS MENUNJUKKAN TANDA IDENTITAS (NPWP/KTP/PASPOR) DAN TANDA TERIMA RESMI PT HIT";
    String term8 = "8. KAMI TIDAK BERTANGGUNG JAWAB ATAS PRODUK DAN JAMINAN YANG LEBIH DARI 3 (TIGA) BULAN TIDAK DIURUS/DIAMBIL OLEH KONSUMEN.";
    String term9 = "9. DENGAN MENDANTANGAI TANDA TERIMA INI, BERARTI KONSUMEN TELAH MENYETUJUI PERSYARATAN PERBAIKAN SESUAI KARTU GARANSI DAN KETENTUAN LAYANAN SERVICE PT HIT";
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
        bluetooth.printCustom(term1,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term2,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term3,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term4,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term5,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term6,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term7,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term8,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom(term9,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("ASLI/REPRINT 1/REPRINT 2",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("TANDA TERIMA JAMINAN",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom("27/06/2020 15:10",0,2);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",0,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",0,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",0,0);
        bluetooth.printCustom("NO SERI:25B00478",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("JUMLAH: RP.200.000",0,0);
        bluetooth.printCustom("TERBILANG: DUA RATUS RIBU RUPIAH",0,0);
        bluetooth.printCustom("DISTRIK SERVICE: KUDUS",0,0);
        bluetooth.printCustom("DICETAK OLEH: amelia_s",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("KITTIR",3,1);
        bluetooth.printCustom("27/06/2020 15:10",0,0);
        bluetooth.printCustom("CASE: CS-KDS-AG-200627001",1,0);
        bluetooth.printCustom("SVC CALL: SC-KDS-AG-200627001",1,0);
        bluetooth.printCustom("TIPE: PRZ 211BW",1,0);
        bluetooth.printCustom("NO SERI:25B00478",1,0);
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

  printContohCetakan(String pathImage,String pathImageTtd) async {
     String printSpace(String string1, String string2){
      String whitespace = '';
      int spasi = 63 - (string1.length + string2.length);
      for(int i=0;i<=spasi;i++){
        whitespace += ' ';
      }
      return whitespace;
    }

    String _kodeplu = "Kode PLU:";
    String kodeplu = "3005537";

    String _nonota = "No. Nota:";
    String nonota = "GT001/27/09/13";
    String _tanggal = "Tanggal:";
    String tanggal = "27/09/13";
    String _pramuniaga = "Pramuniaga:";
    String pramuniaga = "ADMINISTRATOR";
  

    String item1 = "W 3430 BLACK DC X1";
    String kode1 = "S/N: 32L03551";
    String harga1 = "2.499.000";

    String item2 = "POWER BANK X1";
    String harga2 = "0";
    
    String item3 = "G 3100 PINK X1";
    String kode3 = "S/N: 32F00936";
    String harga3 = "549.000";

    String item4 = "C 101 BLACK X1";
    String kode4 = "S/N 32D11403";
    String harga4 = "0";
    
    String total = "Jumlah Rp. 3.048.000";

    
    bluetooth.isConnected.then((isConnected){
      if(isConnected){
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printCustom("MOBILE PHONE",3,1);
        bluetooth.printCustom("GIANT POINT SQUARE",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom(_kodeplu+printSpace(_kodeplu,kodeplu)+kodeplu,0,0);
        bluetooth.printCustom(_nonota+printSpace(_nonota,nonota)+nonota,0,0);
        bluetooth.printCustom(_tanggal+printSpace(_tanggal,tanggal)+tanggal,0,0);
        bluetooth.printCustom(_pramuniaga+printSpace(_pramuniaga,pramuniaga)+pramuniaga,0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("PENJUALAN",3,1);
        bluetooth.printNewLine();
        bluetooth.printCustom(item1+printSpace(item1,harga1)+harga1,0,0);
        bluetooth.printCustom(kode1,0,0);
        bluetooth.printCustom(item2+printSpace(item2,harga2)+harga2,0,0);
        bluetooth.printCustom(item3+printSpace(item3,harga3)+harga3,0,0);
        bluetooth.printCustom(kode3,0,0);
        bluetooth.printCustom(item4+printSpace(item4,harga4)+harga4,0,0);
        bluetooth.printCustom(kode4,0,0);
        bluetooth.printCustom(total,0,2);
        bluetooth.printCustom("Tanda Tangan Pembeli:",0,0);
        bluetooth.printNewLine();
        bluetooth.printCustom("(___________________________________________________________)",0,1);
        bluetooth.printCustom("Perhatian!!!",1,1);
        bluetooth.printCustom("Barang yang sudah dibeli tidak dapat ditukar atau dikembalikan.",0,1);
        bluetooth.paperCut();
      }
    });
  }

  
}