import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nigehajilibraray/image_src_state.dart';
import 'package:nigehajilibraray/library_page.dart';
import 'package:wave_slider/wave_slider.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  double _dragPercentage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('How may images do you need?'),
          WaveSlider(
            displayTrackball: true,
            onChanged: (double dragUpdate) {
              setState(() {
                _dragPercentage = (dragUpdate * 20)
                    .round()
                    .toDouble(); // dragUpdate is a fractional value between 0 and 1
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'I need ' + _dragPercentage.toStringAsFixed(0) + ' images.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            iconSize: 100,
            color: Colors.blue,
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateNotifierProvider<
                      ImageSourceStateNotifier, ImageSourceState>(
                    create: (_) =>
                        //sliderの選択値をstateNotifierに渡す
                        ImageSourceStateNotifier(_dragPercentage.toInt()),
                    //child: HomePage(),
                    child: LibraryPage(),
                  ),
                  //return HomePage();
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
