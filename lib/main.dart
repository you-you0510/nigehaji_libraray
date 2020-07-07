import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nigehajilibraray/image_src_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateNotifierProvider<ImageSourceStateNotifier, ImageSourceState>(
        create: (_) => ImageSourceStateNotifier(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('逃げ恥ライブラリ'),
      ),
      body: Column(
        children: <Widget>[
          FlipCard(
            direction: FlipDirection.HORIZONTAL, // default
            front: Container(
              child: Image.network(
                context.select<ImageSourceState, String>((state) => state.url),
              ),
            ),
            back: Container(
              child: Image.network(
                context.select<ImageSourceState, String>((state) => state.url),
              ),
            ),
            onFlip: () {
              context.read<ImageSourceStateNotifier>().generateUrl();
            },
          ),
        ],
      ),
    );
  }
}
