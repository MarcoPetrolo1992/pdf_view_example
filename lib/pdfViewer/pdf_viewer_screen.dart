import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_view_example/base/base_widget.dart';
import 'package:pdf_view_example/base/init_base_view_model.dart';
import 'package:pdf_view_example/pdfViewer/pdf_viewer_view_model.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({Key? key}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> with InitBaseViewModel<PdfViewerViewModel> {
  late PdfViewerViewModel viewModel;

  ///
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initViewModel();
    });
  }

  ///
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = initBaseViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: _buildAppBar(),
      progress: viewModel.progress,
      child: _buildBody(),
    );
  }

  ///
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("Document"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: viewModel.onShare,
        ),
      ],
    );
  }

  ///
  Widget _buildBody() {
    return Stack(
      children: [
        PDFView(
          filePath: viewModel.filePath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          defaultPage: viewModel.currentPage!,
          fitPolicy: FitPolicy.BOTH,
          preventLinkNavigation: false, // if set to true the link is handled in flutter
          onRender: viewModel.onRender,
          onError: viewModel.onError,
          onPageError: viewModel.onPageError,
          onViewCreated: viewModel.onViewCreated,
          onLinkHandler: viewModel.onLinkHandler,
          onPageChanged: viewModel.onPageChanged,
        ),
      ],
    );
  }
}
