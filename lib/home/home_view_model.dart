import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:pdf_view_example/base/base_view_model.dart';
import 'package:pdf_view_example/pdfViewer/pdf_viewer_screen.dart';
import 'package:pdf_view_example/pdfViewer/pdf_viewer_view_model.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends BaseViewModel {
  //----------------------------------------------------------------------------
  // CLASS PARAMETERS
  //----------------------------------------------------------------------------

  String filePath = "";

  File? file;

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------------------------------------
  HomeViewModel();

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // CLASS METHODS
  //----------------------------------------------------------------------------

  ///
  void initViewModel() async {
    showProgress();

    // filePath = (await fromPdf()).path;
    file = (await fromAsset('assets/demo.pdf', 'demo.pdf'));
    dismissProgress();
  }

  ///
  Future<File> fromPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/example.pdf');

    return await file.writeAsBytes(await pdf.save());
  }

  ///
  Future<File> fromAsset(String asset, String filename) async {
    try {
      var dir = await getTemporaryDirectory();

      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      File file = File('${dir.path}/$filename');
      await file.writeAsBytes(bytes);

      return file;
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
  }

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // ADAPTER
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // GETTER AND SETTER
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // LISTENER
  //----------------------------------------------------------------------------

  void navigateToPdfViewer() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<PdfViewerViewModel>(
          create: (_) => PdfViewerViewModel(file!),
          child: const PdfViewerScreen(),
        ),
      ),
    );
  }

//----------------------------------------------------------------------------
}
