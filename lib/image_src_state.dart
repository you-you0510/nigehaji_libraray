import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nigehajilibraray/util/util.dart';
import 'package:state_notifier/state_notifier.dart';

part 'image_src_state.freezed.dart';
part 'image_src_state.g.dart';

@freezed
abstract class ImageSourceState with _$ImageSourceState {
  static const String initUrl =
      "https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg";

  const factory ImageSourceState({
    @Default(initUrl) String url,
  }) = _ImageSourceState;
  factory ImageSourceState.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceStateFromJson(json);
}

class ImageSourceStateNotifier extends StateNotifier<ImageSourceState> {
  final String urlBase = "https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/";
  //各話と画像数のMap
  final Map chapterMap = {
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

  ImageSourceStateNotifier() : super(const ImageSourceState()) {}

  void generateUrl() {
    //1話～11話
    int chapter = Util.getRandomInt(1, 11);

    //画像番号
    int imageCount = this.chapterMap[chapter];
    int imgNo = Util.getRandomInt(1, imageCount);

    //ex:https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg
    String newUrl = urlBase +
        "g" +
        chapter.toString().padLeft(2, "0") +
        "_" +
        imgNo.toString().padLeft(2, "0") +
        ".jpg";

    state = state.copyWith(url: newUrl);
  }
}
