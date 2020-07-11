import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:nigehajilibraray/image_src_state.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('逃げ恥ライブラリ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if (index <
                        context
                            .read<ImageSourceStateNotifier>()
                            .getUrlCount()) {
                      return _flippableCard(context, index);
                    }

                    return null;
                  },
                )),
          ),
        ],
      ),
    );
  }
}

Widget _flippableCard(BuildContext context, int index) {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  return Container(
    decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
    padding: EdgeInsets.all(10.0),
    child: FlipCard(
      key: cardKey,
      direction: FlipDirection.HORIZONTAL, // default
      front: Card(
        child: Container(
          height: 250,
          child: Image.asset('images/Cartie_thinking_icon.png'),
        ),
      ),
      back: Card(
        child: Container(
          height: 250,
          child: Image.network(
            context.read<ImageSourceStateNotifier>().getUrl(index),
          ),
        ),
      ),
      onFlip: () {
        //TODO: implement nervous breakdown logic.
        print(context.read<ImageSourceStateNotifier>().getUrl(index));
        //context.read<ImageSourceStateNotifier>().generateUrl();
      },
    ),
  );
}
