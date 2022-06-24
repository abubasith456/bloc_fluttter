import 'package:bloc_flutter/model/news_spec.dart';

class SettingState {
  late double fontSize;
  late bool isBold;
  late bool isItalic;
  late String color;
  late String newsCountry;
  late String categotyCode;

  SettingState({
    required this.fontSize,
    required this.isBold,
    required this.isItalic,
    required this.color,
    required this.newsCountry,
    required this.categotyCode,
  });

  SettingState copyWith(
      {fontSize, isBold, isItalic, color, newsCountry, categotyCode}) {
    return SettingState(
      fontSize: fontSize ?? this.fontSize,
      isBold: isBold ?? this.isBold,
      isItalic: isItalic ?? this.isItalic,
      color: color ?? this.color,
      newsCountry: newsCountry ?? this.newsCountry,
      categotyCode: categotyCode ?? this.categotyCode,
    );
  }
}
