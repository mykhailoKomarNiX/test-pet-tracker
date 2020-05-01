import 'package:flutter/material.dart';
import 'package:petTracker/localizations.dart';
import 'package:petTracker/models/language.dart';
import 'package:petTracker/utils/constants.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class SettingsPopup extends StatefulWidget {
  @override
  _SettingsPopupState createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  String _selectedLanguage;

  Function get onSelected => (String result) async {
    setState(() {
      _selectedLanguage = result;
    });
    (await StreamingSharedPreferences.instance).setCustomValue(
      LANGUAGE_KEY,
      supportedLanguages.firstWhere((lng) => lng.asLanguageCode == _selectedLanguage),
      adapter: JsonAdapter(
        serializer: (Language value) => value.toJson(),
      ),
    );
  };

  List<PopupMenuEntry<String>> get mapSupportedLanguagesToCheckedPopupMenuItem => 
    supportedLanguages
      .map((Language language) => CheckedPopupMenuItem<String>(
            value: language.asLanguageCode,
            checked: _selectedLanguage == language.asLanguageCode,
            child: Text(language.label),
          )).toList();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      icon: Icon(Icons.settings),
      itemBuilder: (BuildContext context) => mapSupportedLanguagesToCheckedPopupMenuItem,
    );
  }
}
