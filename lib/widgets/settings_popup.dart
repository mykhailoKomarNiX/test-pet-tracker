import 'package:flutter/material.dart';
import 'package:petTracker/localizations.dart';
import 'package:petTracker/models/language.dart';
import 'package:petTracker/utils/constants.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

enum LanguageCode { en, ja }

class SettingsPopup extends StatefulWidget {
  @override
  _SettingsPopupState createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  LanguageCode _selectedLanguage = LanguageCode.en;
  bool get isEnglish => _selectedLanguage == LanguageCode.en;
  bool get isJapanese => _selectedLanguage == LanguageCode.ja;

  Function get onSelected => (LanguageCode result) async{
    setState(() {
      _selectedLanguage = result;
    });
    (await StreamingSharedPreferences.instance).setCustomValue(
      LANGUAGE_KEY,
      isEnglish
        ? supportedLanguages[0]
        : supportedLanguages[1],
      adapter: JsonAdapter(
        serializer: (Language value) => value.toJson(),
      ),
    );
  };

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<LanguageCode>(
      onSelected: onSelected,
      icon: Icon(Icons.settings),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<LanguageCode>>[
        CheckedPopupMenuItem<LanguageCode>(
          value: LanguageCode.en,
          checked: isEnglish,
          child: Text('English'),
        ),
        CheckedPopupMenuItem<LanguageCode>(
          value: LanguageCode.ja,
          checked: isJapanese,
          child: Text('Japanese'),
        ),
      ],
    );
  }
}
