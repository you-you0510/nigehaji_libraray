import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nigehajilibraray/image_src_state.dart';
import 'package:nigehajilibraray/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateNotifierProvider<ImageSourceStateNotifier, ImageSourceState>(
        create: (_) => ImageSourceStateNotifier(0),
        //child: HomePage(),
        child: StartPage(),
      ),
    );
  }
}
