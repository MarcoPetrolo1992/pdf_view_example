import 'package:flutter/material.dart';
import 'package:pdf_view_example/home/home_screen.dart';
import 'package:pdf_view_example/home/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //TEMA
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //BUILDER
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: child!,
        );
      },

      //INITIAL PATH
      home: ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
        child: const HomeScreen(),
      ),
    );
  }
}
