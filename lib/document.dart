import 'dart:async';

import 'package:flutter/widgets.dart' as fw;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart' as fm;

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);

class MyPage extends Page {
  MyPage(
      {PdfPageFormat pageFormat = PdfPageFormat.a5,
      BuildCallback build,
      EdgeInsets margin})
      : super(pageFormat: pageFormat, margin: margin, build: build);

  @override
  void paint(Widget child, Context context) {
//    context.canvas
//      ..setColor(lightGreen)
//      ..moveTo(0, pageFormat.height)
//      ..lineTo(0, pageFormat.height - 500)
//      ..lineTo(60, pageFormat.height)
//      ..fillPath()
//      ..setColor(green)
//      ..moveTo(0, pageFormat.height)
//      ..lineTo(0, pageFormat.height - 100)
//      ..lineTo(100, pageFormat.height)
//      ..fillPath()
//      ..setColor(lightGreen)
//      ..moveTo(30, pageFormat.height)
//      ..lineTo(110, pageFormat.height - 50)
//      ..lineTo(150, pageFormat.height)
//      ..fillPath()
//      ..moveTo(pageFormat.width, 0)
//      ..lineTo(pageFormat.width, 230)
//      ..lineTo(pageFormat.width - 60, 0)
//      ..fillPath()
//      ..setColor(green)
//      ..moveTo(pageFormat.width, 0)
//      ..lineTo(pageFormat.width, 100)
//      ..lineTo(pageFormat.width - 100, 0)
//      ..fillPath()
//      ..setColor(lightGreen)
//      ..moveTo(pageFormat.width - 30, 0)
//      ..lineTo(pageFormat.width - 110, 50)
//      ..lineTo(pageFormat.width - 150, 0)
//      ..fillPath();

    super.paint(child, context);
  }
}

class Block extends StatelessWidget {
  Block({this.title});

  final String title;

  @override
  Widget build(Context context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 2.5, left: 2, right: 5),
              decoration:
                  const BoxDecoration(color: green, shape: BoxShape.circle),
            ),
            Text(title,
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontWeight: FontWeight.bold)),
          ]),
          Container(
            decoration: const BoxDecoration(
                border: BoxBorder(left: true, color: green, width: 2)),
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const EdgeInsets.only(left: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

class Category extends StatelessWidget {
  Category({this.title});

  final String title;

  @override
  Widget build(Context context) {
    return Container(
        decoration: const BoxDecoration(color: lightGreen, borderRadius: 6),
        margin: const EdgeInsets.only(bottom: 10, top: 20),
        padding: const EdgeInsets.fromLTRB(10, 7, 10, 4),
        child: Text(title, textScaleFactor: 1.5));
  }
}

Future<Document> generateDocument(PdfPageFormat format) async {
  final Document pdf = Document(title: 'My Résumé', author: 'Rendy R');

  final PdfImage profileImage = await pdfImageFromImageProvider(
      pdf: pdf.document,
      image: const fw.NetworkImage(
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&s=200'),
      onError: (dynamic exception, StackTrace stackTrace) {
        print('Unable to download image');
      });

  pdf.addPage(MyPage(
    pageFormat: format.applyMargin(
        left: 3.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    build: (Context context) => Row(children: <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Halo Mas Apriawan',
                          textScaleFactor: 2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Text('HEHEHE',
                          textScaleFactor: 1.2,
                          style: Theme.of(context).defaultTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: green)),
                      Padding(padding: const EdgeInsets.only(top: 20)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('568 Port Washington Road'),
                                  Text('Nordegg, AB T0M 2H0'),
                                  Text('Canada, ON'),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('+1 403-721-6898'),
                                  Text('p.charlesbois@yahoo.com'),
                                  Text('wholeprices.ca')
                                ]),
                            Padding(padding: EdgeInsets.zero)
                          ]),
                    ])),
            Category(title: 'Work Experience'),
            Text('Pengalaman'),
            Block(title: 'Logging equipment operator'),
            Text('Pengalaman'),
            Block(title: 'Foot doctor'),
            Category(title: 'Education'),
            Block(title: 'Bachelor Of Commerce'),
            Block(title: 'Bachelor Interior Design'),
          ])),
      // Container(
      //   height: double.infinity,
      //   width: 10,
      //   decoration: const BoxDecoration(
      //       border: BoxBorder(left: true, color: green, width: 2)),
      // ),
      // Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      //   ClipOval(
      //       child: Container(
      //           width: 100,
      //           height: 100,
      //           color: lightGreen,
      //           child:
      //               profileImage == null ? Container() : Image(profileImage)))
      // ])
    ]),
  ));
  return pdf;
}

Future<Document> generateDocServiceKittir(PdfPageFormat format) async {
  final Document pdf = Document(title: 'Invoice', author: 'Rendy R');

  final PdfImage profileImage = await pdfImageFromImageProvider(
      pdf: pdf.document,
      image: const fw.NetworkImage(
          'https://www.static-src.com/wcsstore/Indraprastha/images/brandlogo//BR-M036969-02658/polytron-logo.jpg'),
      onError: (dynamic exception, StackTrace stackTrace) {
        print('Unable to download image');
      });

  pdf.addPage(MyPage(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) => Row(children: <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 20, bottom: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                          child: Container(
                              width: 100,
                              height: 100,
                              color: lightGreen,
                              child: profileImage == null
                                  ? Container()
                                  : Image(profileImage))),
                      Text('PT SARANA KENCANA MULYA',
                          textScaleFactor: 1.2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 15)),
                      Text('SERVICE TICKET',
                          textScaleFactor: 1.2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 20)),
                    ])),
            Container(
                padding: const EdgeInsets.only(left: 20, bottom: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[Text("27/06/2020 15:10 WIB")]),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('CASE: CS-KDS-AG-200627001'),
                                  Text('SVC CALL: SC-KDS-AG-200627001'),
                                  Text('TIPE: PRZ 211BW'),
                                  Text('NO SERI: 25B00478'),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text('GARANSI: TIDAK GARANSI')
                                ])
                          ]),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("ID NPWP/KTP/PASPOR: 3315072201870000"),
                            Text("NAMA PEMILIK: DARMADI"),
                            Text("ALAMAT: JL.GLUNTUNGAN 3 NO 4"),
                            Text("RT 02/RW 04 BANJARSARI, KRADENAN, GROBOGAN"),
                            Text("TELP: 0291-755282"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text("DISTRIK SERVICE: KUDUS"),
                            Text("DICETAK OLEH: amelia_s"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "HAL-HAL YANG SUDAH DISETUJUI KONSUMEN SEBAGAI SYARAT PERBAIKAN:"),
                            Text(
                                "1. GARANSI DIBERIKAN APABILA PRODUK DISERTAI KARTU GARANSI DAN BUKTI PEMBELIAN YANG ASLI, SAH, DAN BENAR"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "2. UNTUK PRODUK YANG MASIH GARANSI JUAL, MASA BERLAKU S/D..."),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text("3. UNTUK PRODUK TIDAK GARANSI ATAU BEKAS PERBAIKAN DI LUAR SERVICE CENTER RESMI PT HIT; KARENA MEMILIKI RISIKO REPARASI YANG BESAR MAKA " +
                                "KONSEKUENSI ADANYA RISIKO REPARASI DAN TIDAK AKAN MENGAJUKAN KEBERATAN DI KEMUDIAN HARI. RISIKO REPARASI ANTARA LAIN: PRODUK TIDAK BISA DIPERBAIKI, ADANYA KERUSAKAN TAMBAHAN, DLL."),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "4. KAMI TIDAK BERTANGGUNG JAWAB TERHADAP KEHILANGAN/KERUSAKAN DATA DI DALAM MEMORI PRODUK. KONSUMEN HARUS MEM-BACKUP DATANYA SEBELUM DIPERBAIKI."),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "5. ADANYA PERUBAHAN STATUS GARANSI MENJADI TIDAK GARANSI, APABILA DITEMUKAN KESALAHAN GARANSI SETELAH PRODUK DIPERIKSA LEBIH LANJUT."),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text("6. KONDISI PRODUK DAN KELENGKAPANNYA"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "7. SAAT MENGAMBIL BARANG, KONSUMEN HARUS MENUNJUKKAN TANDA IDENTITAS (NPWP/KTP/PASPOR) DAN TANDA TERIMA RESMI PT HIT"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "8. KAMI TIDAK BERTANGGUNG JAWAB ATAS PRODUK DAN JAMINAN YANG LEBIH DARI 3 (TIGA) BULAN TIDAK DIURUS/DIAMBIL OLEH KONSUMEN."),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text(
                                "9. DENGAN MENDANTANGAI TANDA TERIMA INI, BERARTI KONSUMEN TELAH MENYETUJUI PERSYARATAN PERBAIKAN SESUAI KARTU GARANSI DAN KETENTUAN LAYANAN SERVICE PT HIT"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                          ])
                    ])),
          ])),
    ]),
  ));

  pdf.addPage(MyPage(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) => Row(children: <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('TANDA TERIMA JAMINAN',
                          textScaleFactor: 1.2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 25)),
                    ])),
            Container(
                padding: const EdgeInsets.only(left: 20, bottom: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[Text("27/06/2020 15:10 WIB")]),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('CASE: CS-KDS-AG-200627001'),
                                  Text('SVC CALL: SC-KDS-AG-200627001'),
                                  Text('TIPE: PRZ 211BW'),
                                  Text('NO SERI: 25B00478'),
                                ]),
                          ]),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("JUMLAH: RP.200.000"),
                            Text("TERBILANG: DUA RATUS RIBU RUPIAH"),
                            Text("DISTRIK SERVICE: KUDUS"),
                            Text("DICETAK OLEH: amelia_s"),
                            Text("TELP: 0291-755282"),
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            Text("DISTRIK SERVICE: KUDUS"),
                            Text("DICETAK OLEH: amelia_s"),
                          ])
                    ])),
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('KITTIR',
                          textScaleFactor: 1.2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 25)),
                    ])),
            Container(
                padding: const EdgeInsets.only(left: 20, bottom: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[Text("27/06/2020 15:10 WIB")]),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('CASE: CS-KDS-AG-200627001'),
                                  Text('SVC CALL: SC-KDS-AG-200627001'),
                                  Text('TIPE: PRZ 211BW'),
                                  Text('NO SERI: 25B00478'),
                                ]),
                          ]),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("KELENGKAPAN: UNIT, RAK"),
                            Text("KERUSAKAN: TIDAK DINGIN")
                          ])
                    ]))
          ])),
    ]),
  ));
  return pdf;
}

Future<Document> generateDocNotaSukuCadang(PdfPageFormat format) async {
  final Document pdf = Document(title: 'My Résumé', author: 'Rendy R');

  final PdfImage profileImage = await pdfImageFromImageProvider(
      pdf: pdf.document,
      image: const fw.NetworkImage(
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&s=200'),
      onError: (dynamic exception, StackTrace stackTrace) {
        print('Unable to download image');
      });

  pdf.addPage(MyPage(
    pageFormat: format.applyMargin(
        left: 3.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    build: (Context context) => Row(children: <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Halo Mas Apriawan',
                          textScaleFactor: 2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Text('HEHEHE',
                          textScaleFactor: 1.2,
                          style: Theme.of(context).defaultTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: green)),
                      Padding(padding: const EdgeInsets.only(top: 20)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('568 Port Washington Road'),
                                  Text('Nordegg, AB T0M 2H0'),
                                  Text('Canada, ON'),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('+1 403-721-6898'),
                                  Text('p.charlesbois@yahoo.com'),
                                  Text('wholeprices.ca')
                                ]),
                            Padding(padding: EdgeInsets.zero)
                          ]),
                    ])),
            Category(title: 'Work Experience'),
            Text('Pengalaman'),
            Block(title: 'Logging equipment operator'),
            Text('Pengalaman'),
            Block(title: 'Foot doctor'),
            Category(title: 'Education'),
            Block(title: 'Bachelor Of Commerce'),
            Block(title: 'Bachelor Interior Design'),
          ])),
      // Container(
      //   height: double.infinity,
      //   width: 10,
      //   decoration: const BoxDecoration(
      //       border: BoxBorder(left: true, color: green, width: 2)),
      // ),
      // Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      //   ClipOval(
      //       child: Container(
      //           width: 100,
      //           height: 100,
      //           color: lightGreen,
      //           child:
      //               profileImage == null ? Container() : Image(profileImage)))
      // ])
    ]),
  ));
  return pdf;
}

Future<Document> generateDocTandaTerimaJaminan(PdfPageFormat format) async {
  final Document pdf = Document(title: 'My Résumé', author: 'Rendy R');

  final PdfImage profileImage = await pdfImageFromImageProvider(
      pdf: pdf.document,
      image: const fw.NetworkImage(
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&s=200'),
      onError: (dynamic exception, StackTrace stackTrace) {
        print('Unable to download image');
      });

  pdf.addPage(MyPage(
    pageFormat: format.applyMargin(
        left: 3.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    build: (Context context) => Row(children: <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Halo Mas Apriawan',
                          textScaleFactor: 2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Text('HEHEHE',
                          textScaleFactor: 1.2,
                          style: Theme.of(context).defaultTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: green)),
                      Padding(padding: const EdgeInsets.only(top: 20)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('568 Port Washington Road'),
                                  Text('Nordegg, AB T0M 2H0'),
                                  Text('Canada, ON'),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('+1 403-721-6898'),
                                  Text('p.charlesbois@yahoo.com'),
                                  Text('wholeprices.ca')
                                ]),
                            Padding(padding: EdgeInsets.zero)
                          ]),
                    ])),
            Category(title: 'Work Experience'),
            Text('Pengalaman'),
            Block(title: 'Logging equipment operator'),
            Text('Pengalaman'),
            Block(title: 'Foot doctor'),
            Category(title: 'Education'),
            Block(title: 'Bachelor Of Commerce'),
            Block(title: 'Bachelor Interior Design'),
          ])),
      // Container(
      //   height: double.infinity,
      //   width: 10,
      //   decoration: const BoxDecoration(
      //       border: BoxBorder(left: true, color: green, width: 2)),
      // ),
      // Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      //   ClipOval(
      //       child: Container(
      //           width: 100,
      //           height: 100,
      //           color: lightGreen,
      //           child:
      //               profileImage == null ? Container() : Image(profileImage)))
      // ])
    ]),
  ));
  return pdf;
}

Future<Document> generateDocInvoiceNettingJaminan(PdfPageFormat format) async {
  final Document pdf = Document(title: 'Invoice', author: 'Rendy R');

  final PdfImage profileImage = await pdfImageFromImageProvider(
      pdf: pdf.document,
      image: const fw.NetworkImage(
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&s=200'),
      onError: (dynamic exception, StackTrace stackTrace) {
        print('Unable to download image');
      });

  pdf.addPage(MyPage(
    pageFormat: format.applyMargin(
        left: 3.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    build: (Context context) => Row(children: <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Halo Mas Apriawan',
                          textScaleFactor: 2,
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Text('HEHEHE',
                          textScaleFactor: 1.2,
                          style: Theme.of(context).defaultTextStyle.copyWith(
                              fontWeight: FontWeight.bold, color: green)),
                      Padding(padding: const EdgeInsets.only(top: 20)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('568 Port Washington Road'),
                                  Text('Nordegg, AB T0M 2H0'),
                                  Text('Canada, ON'),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('+1 403-721-6898'),
                                  Text('p.charlesbois@yahoo.com'),
                                  Text('wholeprices.ca')
                                ]),
                            Padding(padding: EdgeInsets.zero)
                          ]),
                    ])),
            Category(title: 'Work Experience'),
            Text('Pengalaman'),
            Block(title: 'Logging equipment operator'),
            Text('Pengalaman'),
            Block(title: 'Foot doctor'),
            Category(title: 'Education'),
            Block(title: 'Bachelor Of Commerce'),
            Block(title: 'Bachelor Interior Design'),
          ])),
      // Container(
      //   height: double.infinity,
      //   width: 10,
      //   decoration: const BoxDecoration(
      //       border: BoxBorder(left: true, color: green, width: 2)),
      // ),
      // Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      //   ClipOval(
      //       child: Container(
      //           width: 100,
      //           height: 100,
      //           color: lightGreen,
      //           child:
      //               profileImage == null ? Container() : Image(profileImage)))
      // ])
    ]),
  ));
  return pdf;
}
