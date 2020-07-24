import 'package:flippable_box/flippable_box.dart';
import 'package:flutter/material.dart';
import 'package:nigehajilibraray/image_src_state.dart';
import 'package:provider/provider.dart';

class NervousBreakdownPage extends StatefulWidget {
  @override
  _NervousBreakdownPageState createState() => _NervousBreakdownPageState();
}

class _NervousBreakdownPageState extends State<NervousBreakdownPage> {
  List<bool> _isFlippedList;
  List<bool> _isLockedList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int listCount = this.context.read<ImageSourceStateNotifier>().urlCount;
    _isFlippedList = new List.generate(listCount, (index) => false);
    _isLockedList = new List.generate(listCount, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('逃げ恥神経衰弱'),
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
                        context.read<ImageSourceStateNotifier>().urlCount) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          _onTap(index);
                        }),
                        child: FlippableBox(
                          front: Container(
                            height: 250,
                            child:
                                Image.asset('images/Cartie_thinking_icon.png'),
                          ),
                          back: Container(
                            height: 250,
                            child: Image.network(
                              context
                                  .read<ImageSourceStateNotifier>()
                                  .getUrl(index),
                            ),
                          ),
                          isFlipped: _isFlippedList[index],
                        ),
                      );
                    }

                    return null;
                  },
                )),
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    ImageSourceStateNotifier notifier =
        this.context.read<ImageSourceStateNotifier>();
    String card = notifier.getUrl(index);

    //no operation when card is locked.
    if (_isLockedList[index] == true) {
      return;
    }

    _isFlippedList[index] = !_isFlippedList[index];
    _isLockedList[index] = true;

    notifier.setCard(index, card);

    GameState state = notifier.validate();
    switch (state) {
      case GameState.Continue:
        break;
      case GameState.Matched:
      case GameState.Unmatched:
        _openModalBottomSheet(state);
        break;
      default:
    }
  }

  void _openModalBottomSheet(GameState state) {
    ImageSourceStateNotifier notifier =
        this.context.read<ImageSourceStateNotifier>();
    String message;

    if (state == GameState.Matched) {
      message = 'You got it!\nKeep it on!!';
    } else {
      message = 'omg...';
    }

    showModalBottomSheet(
      context: this.context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(message),
        );
      },
    ).whenComplete(
      () => setState(() {
        if (state == GameState.Unmatched) {
          _isFlippedList[notifier.firstCardIndex] = false;
          _isLockedList[notifier.firstCardIndex] = false;
          _isFlippedList[notifier.secondCardIndex] = false;
          _isLockedList[notifier.secondCardIndex] = false;
        }
        notifier.initState();
      }),
    );
  }
}
