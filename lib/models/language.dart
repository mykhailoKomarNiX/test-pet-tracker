import 'dart:ui';
import 'package:flutter/material.dart';

class Language {
  final String languageCode;
  final String countryCode;
  const Language({@required this.languageCode, this.countryCode = ''});

  Locale get asLocale => Locale(languageCode, countryCode);
  String get asLanguageCode => languageCode;
}
