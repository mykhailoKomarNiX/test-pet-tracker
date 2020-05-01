import 'package:flutter/material.dart';

enum Language { en, ja }

class SettingsPopup extends StatefulWidget {
  @override
  _SettingsPopupState createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  Language _selectedLanguage = Language.en;
  bool get isEnglish => _selectedLanguage == Language.en;
  bool get isJapanese => _selectedLanguage == Language.ja;

  Function get onSelected => (Language result) {
    setState(() {
      _selectedLanguage = result;
    });
  };

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Language>(
      onSelected: onSelected,
      icon: Icon(Icons.settings),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
        CheckedPopupMenuItem<Language>(
          value: Language.en,
          checked: isEnglish,
          child: Text('English'),
        ),
        CheckedPopupMenuItem<Language>(
          value: Language.ja,
          checked: isJapanese,
          child: Text('Japanese'),
        ),
      ],
    );
  }
}
