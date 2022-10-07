import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Future<void> launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print("launchURL: $e");
    }
  }
}

class Constants {
  static const String themeDark = "theme_dark";
  static const String themeLight = "theme_light";
}
