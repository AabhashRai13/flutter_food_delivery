import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

const String prefsVersion = "PREFS_VERSION";
const String prefsDateTime = "PREFS_DATE_TIME";
const String prefsAccessToken = "PREFS_ACCESS_TOKEN";
const String prefsComplaintVersion = "PREFS_COMPLAINT_VERSION";
const String prefsSelectedLanguage = "PREFS_SELECTED_LANGUAGE";
const String prefsNotificationEnabled = "PREFS_NOTIFICAGION_ENABLED";
const String countQuestionResponseApi = "COUNT_QUESTION_RESPONSE_API";
const String getVideoApi = "VIDEO_RESPONSE_API";
const String getAudioApi = "AUDIO_RESPONSE_API";
const String postAnswer = "POST_ANSWER_API";
const String postAudio = "POST_AUDIO_API";
const String postImage = "POST_IMAGE_API";
const String cameraPersmission = "CAMERA_PERMISSION";
const String microPhonePermission = "MICROPHONE_PERMISSION";
const String userId = "USER_ID";
const String shopName = "ShopName";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> setUserId(String userIdd) async {
    _sharedPreferences.setString(userId, userIdd);
  }

  Future<String?> getUserID() async {
    return _sharedPreferences.getString(userId);
  }
    Future<void> setshopName(String shopNamed) async {
    _sharedPreferences.setString(shopName, shopNamed);
  }

  Future<String?> getshopName() async {
    return _sharedPreferences.getString(shopName);
  }

  Future<void> setApiCounters(String key, int count) async {
    _sharedPreferences.setInt(key, count);
  }

  Future<int?> getApiCounters(String key) async {
    return _sharedPreferences.getInt(key);
  }

  Future<void> setAccessToken(String token) async {
    _sharedPreferences.setString(prefsAccessToken, token);
  }

  Future<String?> getAccessToken() async {
    return _sharedPreferences.getString(prefsAccessToken);
  }

  Future<void> setLanguage(String language) async {
    _sharedPreferences.setString(prefsSelectedLanguage, language);
  }

  Future<String?> getLanguage() async {
    return _sharedPreferences.getString(prefsSelectedLanguage);
  }

  Future<void> setNotificationEnabled(bool notification) async {
    _sharedPreferences.setBool(prefsNotificationEnabled, notification);
  }

  Future<bool?> getNotificationEnabled() async {
    return _sharedPreferences.getBool(prefsNotificationEnabled);
  }

  Future<void> setAppVersion(String v) async {
    _sharedPreferences.setString(prefsVersion, v);
  }

  Future<String?> getAppVersion() async {
    return _sharedPreferences.getString(prefsVersion);
  }

  Future<void> setComplaintVersion(dynamic v) async {
    _sharedPreferences.setString(prefsComplaintVersion, v);
  }

  Future<String?> getComplaintVersion() async {
    return _sharedPreferences.getString(prefsComplaintVersion);
  }

  Future<void> setDateTimeStamps(String d) async {
    _sharedPreferences.setString(prefsDateTime, d);
  }

  Future<String?> getDateTimeStamps() async {
    return _sharedPreferences.getString(prefsDateTime);
  }

  Future<bool> putBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }

  Future<void> clearPrefs() async {
    _sharedPreferences.remove(prefsAccessToken);
    // _sharedPreferences.clear();
  }
}
