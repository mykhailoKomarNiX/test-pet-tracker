import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petTracker/localizations.dart';
import 'package:petTracker/models/language.dart';
import 'package:petTracker/pages/home.dart';
import 'package:petTracker/utils/constants.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    PreferenceBuilder<Language>(
        preference: (await StreamingSharedPreferences.instance).getCustomValue(
          LANGUAGE_KEY,
          defaultValue: supportedLanguages[0],
          adapter: JsonAdapter(
            deserializer: (value) => Language.fromJson(value),
          ),
        ),
        builder: (BuildContext context, Language language) {
          return PetTrackerApp(language.asLocale);
        }),
  );
}

class PetTrackerApp extends StatelessWidget {
  final Locale locale;
  const PetTrackerApp(this.locale);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      supportedLocales: supportedLanguages.map((lng) => lng.asLocale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}
