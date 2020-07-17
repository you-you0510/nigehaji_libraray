// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'image_src_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ImageSourceState _$ImageSourceStateFromJson(Map<String, dynamic> json) {
  return _ImageSourceState.fromJson(json);
}

class _$ImageSourceStateTearOff {
  const _$ImageSourceStateTearOff();

  _ImageSourceState call(
      {String url = 'https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg',
      int imageCount = 5,
      List<String> urlList = const [],
      String firstCard = '',
      String secondCard = ''}) {
    return _ImageSourceState(
      url: url,
      imageCount: imageCount,
      urlList: urlList,
      firstCard: firstCard,
      secondCard: secondCard,
    );
  }
}

// ignore: unused_element
const $ImageSourceState = _$ImageSourceStateTearOff();

mixin _$ImageSourceState {
  String get url;
  int get imageCount;
  List<String> get urlList;
  String get firstCard;
  String get secondCard;

  Map<String, dynamic> toJson();
  $ImageSourceStateCopyWith<ImageSourceState> get copyWith;
}

abstract class $ImageSourceStateCopyWith<$Res> {
  factory $ImageSourceStateCopyWith(
          ImageSourceState value, $Res Function(ImageSourceState) then) =
      _$ImageSourceStateCopyWithImpl<$Res>;
  $Res call(
      {String url,
      int imageCount,
      List<String> urlList,
      String firstCard,
      String secondCard});
}

class _$ImageSourceStateCopyWithImpl<$Res>
    implements $ImageSourceStateCopyWith<$Res> {
  _$ImageSourceStateCopyWithImpl(this._value, this._then);

  final ImageSourceState _value;
  // ignore: unused_field
  final $Res Function(ImageSourceState) _then;

  @override
  $Res call({
    Object url = freezed,
    Object imageCount = freezed,
    Object urlList = freezed,
    Object firstCard = freezed,
    Object secondCard = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed ? _value.url : url as String,
      imageCount: imageCount == freezed ? _value.imageCount : imageCount as int,
      urlList: urlList == freezed ? _value.urlList : urlList as List<String>,
      firstCard: firstCard == freezed ? _value.firstCard : firstCard as String,
      secondCard:
          secondCard == freezed ? _value.secondCard : secondCard as String,
    ));
  }
}

abstract class _$ImageSourceStateCopyWith<$Res>
    implements $ImageSourceStateCopyWith<$Res> {
  factory _$ImageSourceStateCopyWith(
          _ImageSourceState value, $Res Function(_ImageSourceState) then) =
      __$ImageSourceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String url,
      int imageCount,
      List<String> urlList,
      String firstCard,
      String secondCard});
}

class __$ImageSourceStateCopyWithImpl<$Res>
    extends _$ImageSourceStateCopyWithImpl<$Res>
    implements _$ImageSourceStateCopyWith<$Res> {
  __$ImageSourceStateCopyWithImpl(
      _ImageSourceState _value, $Res Function(_ImageSourceState) _then)
      : super(_value, (v) => _then(v as _ImageSourceState));

  @override
  _ImageSourceState get _value => super._value as _ImageSourceState;

  @override
  $Res call({
    Object url = freezed,
    Object imageCount = freezed,
    Object urlList = freezed,
    Object firstCard = freezed,
    Object secondCard = freezed,
  }) {
    return _then(_ImageSourceState(
      url: url == freezed ? _value.url : url as String,
      imageCount: imageCount == freezed ? _value.imageCount : imageCount as int,
      urlList: urlList == freezed ? _value.urlList : urlList as List<String>,
      firstCard: firstCard == freezed ? _value.firstCard : firstCard as String,
      secondCard:
          secondCard == freezed ? _value.secondCard : secondCard as String,
    ));
  }
}

@JsonSerializable()
class _$_ImageSourceState
    with DiagnosticableTreeMixin
    implements _ImageSourceState {
  const _$_ImageSourceState(
      {this.url = 'https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg',
      this.imageCount = 5,
      this.urlList = const [],
      this.firstCard = '',
      this.secondCard = ''})
      : assert(url != null),
        assert(imageCount != null),
        assert(urlList != null),
        assert(firstCard != null),
        assert(secondCard != null);

  factory _$_ImageSourceState.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageSourceStateFromJson(json);

  @JsonKey(
      defaultValue: 'https://www.tbs.co.jp/NIGEHAJI_tbs/gallery/img/g01_01.jpg')
  @override
  final String url;
  @JsonKey(defaultValue: 5)
  @override
  final int imageCount;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> urlList;
  @JsonKey(defaultValue: '')
  @override
  final String firstCard;
  @JsonKey(defaultValue: '')
  @override
  final String secondCard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageSourceState(url: $url, imageCount: $imageCount, urlList: $urlList, firstCard: $firstCard, secondCard: $secondCard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageSourceState'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('imageCount', imageCount))
      ..add(DiagnosticsProperty('urlList', urlList))
      ..add(DiagnosticsProperty('firstCard', firstCard))
      ..add(DiagnosticsProperty('secondCard', secondCard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageSourceState &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.imageCount, imageCount) ||
                const DeepCollectionEquality()
                    .equals(other.imageCount, imageCount)) &&
            (identical(other.urlList, urlList) ||
                const DeepCollectionEquality()
                    .equals(other.urlList, urlList)) &&
            (identical(other.firstCard, firstCard) ||
                const DeepCollectionEquality()
                    .equals(other.firstCard, firstCard)) &&
            (identical(other.secondCard, secondCard) ||
                const DeepCollectionEquality()
                    .equals(other.secondCard, secondCard)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(imageCount) ^
      const DeepCollectionEquality().hash(urlList) ^
      const DeepCollectionEquality().hash(firstCard) ^
      const DeepCollectionEquality().hash(secondCard);

  @override
  _$ImageSourceStateCopyWith<_ImageSourceState> get copyWith =>
      __$ImageSourceStateCopyWithImpl<_ImageSourceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageSourceStateToJson(this);
  }
}

abstract class _ImageSourceState implements ImageSourceState {
  const factory _ImageSourceState(
      {String url,
      int imageCount,
      List<String> urlList,
      String firstCard,
      String secondCard}) = _$_ImageSourceState;

  factory _ImageSourceState.fromJson(Map<String, dynamic> json) =
      _$_ImageSourceState.fromJson;

  @override
  String get url;
  @override
  int get imageCount;
  @override
  List<String> get urlList;
  @override
  String get firstCard;
  @override
  String get secondCard;
  @override
  _$ImageSourceStateCopyWith<_ImageSourceState> get copyWith;
}
