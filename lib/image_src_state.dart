import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nigehajilibraray/util/util.dart';
import 'package:state_notifier/state_notifier.dart';

part 'image_src_state.freezed.dart';
part 'image_src_state.g.dart';

enum GameState {
  Matched,
  Unmatched,
  Continue,
}

@freezed
abstract class ImageSourceState with _$ImageSourceState {
  const factory ImageSourceState({
    @Default('https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg')
        String url,
    @Default(5) int imageCount,
    @Default([]) List<String> urlList,
    @Default(0) int firstCardIndex,
    @Default("") String firstCard,
    @Default(0) int secondCardIndex,
    @Default("") String secondCard,
  }) = _ImageSourceState;
  factory ImageSourceState.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceStateFromJson(json);
}

class ImageSourceStateNotifier extends StateNotifier<ImageSourceState> {
  final String _urlBase = "https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/";
  //各話と画像数のMap
  final Map<int, int> _chapterMap = {
    1: 31,
    2: 20,
    3: 28,
    4: 16,
    5: 20,
    6: 24,
    7: 24,
    8: 20,
    9: 20,
    10: 24,
    11: 28
  };

  ///
  /// constructor
  ///
  ImageSourceStateNotifier(int count) : super(const ImageSourceState()) {
    List<String> urls = new List<String>();

    for (int index = 0; index < count; index++) {
      //重複しないようにurlを生成
      String url = _generateUrl();
      while (urls.contains(url)) {
        url = _generateUrl();
      }

      //ペアにするため、２枚追加
      urls.add(url);
      urls.add(url);
    }

    urls.shuffle();

    state = state.copyWith(imageCount: count, urlList: urls);
  }

  String _generateUrl() {
    //1話～11話
    int chapter = Util.getRandomInt(1, 11);

    //画像番号
    int imageCount = _chapterMap[chapter];
    int imgNo = Util.getRandomInt(1, imageCount);

    //ex:https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg
    String newUrl = _urlBase +
        "g" +
        chapter.toString().padLeft(2, "0") +
        "_" +
        imgNo.toString().padLeft(2, "0") +
        ".jpg";

    state = state.copyWith(url: newUrl);

    return newUrl;
  }

  String getUrl(int index) {
    return state.urlList[index];
  }

  int get urlCount {
    return state.urlList.length;
  }

  int get firstCardIndex {
    return state.firstCardIndex;
  }

  int get secondCardIndex {
    return state.secondCardIndex;
  }

  void setCard(int index, String card) {
    if (state.firstCard == '') {
      state = state.copyWith(firstCardIndex: index, firstCard: card);
    } else {
      state = state.copyWith(secondCardIndex: index, secondCard: card);
    }
  }

  GameState validate() {
    GameState result;

    result = GameState.Continue;
    if (state.firstCard != '' && state.secondCard != '') {
      if (state.firstCard == state.secondCard) {
        result = GameState.Matched;
      } else {
        result = GameState.Unmatched;
      }
    }

    return result;
  }

  void initState() {
    state = state.copyWith(
        firstCardIndex: 0, firstCard: '', secondCardIndex: 0, secondCard: '');
  }
}
