// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_src_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageSourceState _$_$_ImageSourceStateFromJson(Map<String, dynamic> json) {
  return _$_ImageSourceState(
    url: json['url'] as String ??
        'https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg',
    imageCount: json['imageCount'] as int ?? 5,
    urlList: (json['urlList'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$_$_ImageSourceStateToJson(
        _$_ImageSourceState instance) =>
    <String, dynamic>{
      'url': instance.url,
      'imageCount': instance.imageCount,
      'urlList': instance.urlList,
    };
