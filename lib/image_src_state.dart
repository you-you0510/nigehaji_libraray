import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  ImageSourceStateNotifier() : super(const ImageSourceState()) {}

  void generateUrl() {
    //1話～11話
    int chapter = 0;
    while (chapter == 0) {
      chapter = new Random().nextInt(11);
    }
    //画像番号（おそらく20枚はあるはず）
    int imgNo = 0;
    while (imgNo == 0) {
      imgNo = new Random().nextInt(20);
    }

    //ex:https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg
    String newUrl = urlBase +
        "g" +
        chapter.toString().padLeft(2, "0") +
        "_" +
        imgNo.toString().padLeft(2, "0") +
        ".jpg";

    state = state.copyWith(url: newUrl);
    print(newUrl);
  }
}
