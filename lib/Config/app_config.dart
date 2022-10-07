

import 'package:hungerz_store/Locale/arabic.dart';
import 'package:hungerz_store/Locale/english.dart';
import 'package:hungerz_store/Locale/french.dart';
import 'package:hungerz_store/Locale/german.dart';
import 'package:hungerz_store/Locale/indonesian.dart';
import 'package:hungerz_store/Locale/italian.dart';
import 'package:hungerz_store/Locale/portuguese.dart';
import 'package:hungerz_store/Locale/romanian.dart';
import 'package:hungerz_store/Locale/spanish.dart';
import 'package:hungerz_store/Locale/swahili.dart';
import 'package:hungerz_store/Locale/turkish.dart';

class AppConfig {
  static final String appName = "Hungerz store";
  static final bool isDemoMode = true;
  static const String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    "en": AppLanguage("English", english()),
    "ar": AppLanguage("عربى", arabic()),
    "pt": AppLanguage("Portugal", portuguese()),
    "fr": AppLanguage("Français", french()),
    "id": AppLanguage("Bahasa Indonesia", indonesian()),
    "es": AppLanguage("Español", spanish()),
    "it": AppLanguage("italiano", italian()),
    "tr": AppLanguage("Türk", turkish()),
    "sw": AppLanguage("Kiswahili", swahili()),
    "de": AppLanguage("Deutsch", german()),
    "ro": AppLanguage("Română", romanian()),
  };
}

class AppLanguage {
  final String name;
  final Map<String, String> values;
  AppLanguage(this.name, this.values);
}
