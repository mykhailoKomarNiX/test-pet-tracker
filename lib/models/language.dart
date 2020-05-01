import 'dart:ui';
import 'package:flutter/material.dart';

class Language {
  final String languageCode;
  final String countryCode;
  const Language({@required this.languageCode, this.countryCode = ''});

  Locale get asLocale => Locale(languageCode, countryCode);
  String get asLanguageCode => languageCode;

  factory Language.fromJson(Map<String, dynamic> value) {
    return Language(
      languageCode: value['languageCode'] as String,
      countryCode: value['countryCode'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'languageCode': languageCode,
    'countryCode': countryCode,
  };
}
