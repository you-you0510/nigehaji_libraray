import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:nigehajilibraray/image_src_state.dart';
import 'package:provider/provider.dart';

class NervousBreakdownPage extends StatefulWidget {
  @override
  _NervousBreakdownPageState createState() => _NervousBreakdownPageState();
}

class _NervousBreakdownPageState extends State<NervousBreakdownPage> {
  //TODO: スクロールすると画面外のカードの状態が初期化される現象を解決

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
      flipOnTouch: true,
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
        ImageSourceStateNotifier notifier =
            context.read<ImageSourceStateNotifier>();
        String card = notifier.getUrl(index);

        notifier.setCard(card);
        GameState state = notifier.validate();
        switch (state) {
          case GameState.Continue:
            //TODO: Lock opened card.
            break;
          case GameState.Matched:
            //TODO: Lock opened card pair.
            break;
          case GameState.Unmatched:
            //TODO: Toggle cards.
            break;
          default:
        }
      },
    ),
  );
}
