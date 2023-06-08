import 'package:pdf_view_example/base/base_widget.dart';
import 'package:pdf_view_example/base/init_base_view_model.dart';
import 'package:pdf_view_example/home/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with InitBaseViewModel<HomeViewModel> {
  late HomeViewModel viewModel;

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

  ///
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      progress: viewModel.progress,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: viewModel.navigateToPdfViewer,
              child: const Text("Open PDF"),
            ),
            TextButton(
              onPressed: viewModel.sharePdf,
              child: const Text("Share PDF from base64"),
            ),
          ],
        ),
      ),
    );
  }
}
