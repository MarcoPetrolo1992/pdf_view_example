import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_view_example/base/base_view_model.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';

class PdfViewerViewModel extends BaseViewModel {
  //----------------------------------------------------------------------------
  // CLASS PARAMETERS
  //----------------------------------------------------------------------------

  final Completer<PDFViewController> pdfViewController = Completer<PDFViewController>();

  int? pages = 0;

  int? currentPage = 0;

  String errorMessage = '';

  late File _file;

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------------------------------------
  PdfViewerViewModel(this._file);

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // CLASS METHODS
  //----------------------------------------------------------------------------

  ///
  void initViewModel() {
    showProgress();
  }

  ///
  @override
  void dispose() {
    super.dispose();
  }

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // ADAPTER
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // GETTER AND SETTER
  //----------------------------------------------------------------------------

  ///
  String get filePath => _file.path;

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // LISTENER
  //----------------------------------------------------------------------------

  ///
  void onRender(int? pages) {
    pages = pages;
    dismissProgress();
    notifyListeners();
  }

  ///
  void onError(dynamic error) {
    errorMessage = error.toString();
    print(errorMessage);
    notifyListeners();
  }

  ///
  void onPageError(int? page, dynamic error) {
    errorMessage = error.toString();
    notifyListeners();
  }

  ///
  void onLinkHandler(String? uri) {}

  ///
  void onPageChanged(int? page, int? total) {
    currentPage = page;
    notifyListeners();
  }

  ///
  void onViewCreated(PDFViewController controller) {
    pdfViewController.complete(controller);
  }

  ///
  void onShare() async {
    var xfile = XFile.fromData(
      _file.readAsBytesSync(),
      mimeType: "application/pdf",
    );
    // _onShare method:
    final box = context.findRenderObject() as RenderBox?;

    await Share.shareXFiles(
      [xfile],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

/*  _sharePDF() async {

    await Printing.sharePdf(
      bytes: await _buildDocumentFromBarcode().save(),
      filename: 'barcode_${DateTime.now().millisecondsSinceEpoch}.pdf',
    );
  }*/

//----------------------------------------------------------------------------
}
