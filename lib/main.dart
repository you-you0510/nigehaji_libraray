import 'package:flutter/material.dart';
import 'package:nigehajilibraray/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
      //home: StateNotifierProvider<ImageSourceStateNotifier, ImageSourceState>(
      //  create: (_) => ImageSourceStateNotifier(0),
      //  child: StartPage(),
      //),
    );
  }
}
