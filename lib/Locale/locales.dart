import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:hungerz_store/Config/app_config.dart';
import 'package:hungerz_store/Locale/german.dart';
import 'package:hungerz_store/Locale/italian.dart';
import 'package:hungerz_store/Locale/romanian.dart';
import 'package:hungerz_store/Locale/swahili.dart';
import 'package:hungerz_store/Locale/turkish.dart';
import 'dart:async';

import 'arabic.dart';
import 'english.dart';
import 'french.dart';
import 'indonesian.dart';
import 'portuguese.dart';
import 'spanish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'it': italian(),
    'tr': turkish(),
    'sw': swahili(),
    "de": german(),
    "ro": romanian(),
  };

  String? get type {
    return _localizedValues[locale.languageCode]!['type'];
  }

  String? get fullNamee {
    return _localizedValues[locale.languageCode]!['fullNamee'];
  }

  String? get cheese {
    return _localizedValues[locale.languageCode]!['cheese'];
  }

  String? get sandwich {
    return _localizedValues[locale.languageCode]!['sandwich'];
  }

  String? get csandwich {
    return _localizedValues[locale.languageCode]!['csandwich'];
  }

  String? get frankie {
    return _localizedValues[locale.languageCode]!['frankie'];
  }

  String? get chicken {
    return _localizedValues[locale.languageCode]!['chicken'];
  }

  String? get cash {
    return _localizedValues[locale.languageCode]!['cash'];
  }

  String? get juice {
    return _localizedValues[locale.languageCode]!['juice'];
  }

  String? get burger {
    return _localizedValues[locale.languageCode]!['burger'];
  }

  String? get stater {
    return _localizedValues[locale.languageCode]!['stater'];
  }

  String? get mainCourse {
    return _localizedValues[locale.languageCode]!['mainCourse'];
  }

  String? get customize {
    return _localizedValues[locale.languageCode]!['customize'];
  }

  String? get veg {
    return _localizedValues[locale.languageCode]!['veg'];
  }

  String? get nonVeg {
    return _localizedValues[locale.languageCode]!['nonVeg'];
  }

  String? get fast {
    return _localizedValues[locale.languageCode]!['fast'];
  }

  String? get sea {
    return _localizedValues[locale.languageCode]!['sea'];
  }

  String? get chinese {
    return _localizedValues[locale.languageCode]!['chinese'];
  }

  String? get desert {
    return _localizedValues[locale.languageCode]!['desert'];
  }

  String? get invalidNumber {
    return _localizedValues[locale.languageCode]!['invalidNumber'];
  }

  String? get networkError {
    return _localizedValues[locale.languageCode]!['networkError'];
  }

  String? get register {
    return _localizedValues[locale.languageCode]!['register'];
  }

  String? get invalidName {
    return _localizedValues[locale.languageCode]!['invalidName'];
  }

  String? get invalidEmail {
    return _localizedValues[locale.languageCode]!['invalidEmail'];
  }

  String? get invalidNameAndEmail {
    return _localizedValues[locale.languageCode]!['invalidNameAndEmail'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get mobileNumber {
    return _localizedValues[locale.languageCode]!['mobileNumber'];
  }

  String? get verificationText {
    return _localizedValues[locale.languageCode]!['verificationText'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get checkNetwork {
    return _localizedValues[locale.languageCode]!['checkNetwork'];
  }

  String? get invalidOTP {
    return _localizedValues[locale.languageCode]!['invalidOTP'];
  }

  String? get enterVerification {
    return _localizedValues[locale.languageCode]!['enterVerification'];
  }

  String? get verificationCode {
    return _localizedValues[locale.languageCode]!['verificationCode'];
  }

  String? get resend {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get offlineText {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get onlineText {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get goOnline {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get editt {
    return _localizedValues[locale.languageCode]!['editt'];
  }

  String? get goOffline {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get orders {
    return _localizedValues[locale.languageCode]!['orders'];
  }

  String? get itemSold {
    return _localizedValues[locale.languageCode]!['itemSold'];
  }

  String? get earnings {
    return _localizedValues[locale.languageCode]!['earnings'];
  }

  String? get location {
    return _localizedValues[locale.languageCode]!['earnings'];
  }

  String? get grant {
    return _localizedValues[locale.languageCode]!['earnings'];
  }

  String? get bodyText1 {
    return _localizedValues[locale.languageCode]!['bodyText1'];
  }

  String? get bodyText2 {
    return _localizedValues[locale.languageCode]!['bodyText2'];
  }

  String? get mobileText {
    return _localizedValues[locale.languageCode]!['mobileText'];
  }

  String? get continueText {
    return _localizedValues[locale.languageCode]!['continueText'];
  }

  String? get homeText {
    return _localizedValues[locale.languageCode]!['homeText'];
  }

  String? get account {
    return _localizedValues[locale.languageCode]!['account'];
  }

  String? get orderText {
    return _localizedValues[locale.languageCode]!['orderText'];
  }

  String? get tnc {
    return _localizedValues[locale.languageCode]!['tnc'];
  }

  String? get insight {
    return _localizedValues[locale.languageCode]!['insight'];
  }

  String? get wallet {
    return _localizedValues[locale.languageCode]!['wallet'];
  }

  String? get support {
    return _localizedValues[locale.languageCode]!['support'];
  }

  String? get aboutUs {
    return _localizedValues[locale.languageCode]!['aboutUs'];
  }

  String? get login {
    return _localizedValues[locale.languageCode]!['login'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get loggingOut {
    return _localizedValues[locale.languageCode]!['loggingOut'];
  }

  String? get areYouSure {
    return _localizedValues[locale.languageCode]!['areYouSure'];
  }

  String? get yes {
    return _localizedValues[locale.languageCode]!['yes'];
  }

  String? get no {
    return _localizedValues[locale.languageCode]!['no'];
  }

  String? get sendToBank {
    return _localizedValues[locale.languageCode]!['sendToBank'];
  }

  String? get availableBalance {
    return _localizedValues[locale.languageCode]!['availableBalance'];
  }

  String? get accountHolderName {
    return _localizedValues[locale.languageCode]!['accountHolderName'];
  }

  String? get bankName {
    return _localizedValues[locale.languageCode]!['bankName'];
  }

  String? get branchCode {
    return _localizedValues[locale.languageCode]!['branchCode'];
  }

  String? get accountNumber {
    return _localizedValues[locale.languageCode]!['accountNumber'];
  }

  String? get enterAmountToTransfer {
    return _localizedValues[locale.languageCode]!['enterAmountToTransfer'];
  }

  String? get bankInfo {
    return _localizedValues[locale.languageCode]!['bankInfo'];
  }

  String? get aboutDelivoo {
    return _localizedValues[locale.languageCode]!['aboutDelivoo'];
  }

  String? get ourVision {
    return _localizedValues[locale.languageCode]!['ourVision'];
  }

  String? get companyPolicy {
    return _localizedValues[locale.languageCode]!['companyPolicy'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get message {
    return _localizedValues[locale.languageCode]!['message'];
  }

  String? get enterMessage {
    return _localizedValues[locale.languageCode]!['enterMessage'];
  }

  String? get orWrite {
    return _localizedValues[locale.languageCode]!['orWrite'];
  }

  String? get yourWords {
    return _localizedValues[locale.languageCode]!['yourWords'];
  }

  String? get online {
    return _localizedValues[locale.languageCode]!['online'];
  }

  String? get recent {
    return _localizedValues[locale.languageCode]!['recent'];
  }

  String? get vegetable {
    return _localizedValues[locale.languageCode]!['vegetable'];
  }

  String? get today {
    return _localizedValues[locale.languageCode]!['today'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get editProfile {
    return _localizedValues[locale.languageCode]!['editProfile'];
  }

  String? get featureImage {
    return _localizedValues[locale.languageCode]!['featureImage'];
  }

  String? get uploadPhoto {
    return _localizedValues[locale.languageCode]!['uploadPhoto'];
  }

  String? get profileInfo {
    return _localizedValues[locale.languageCode]!['profileInfo'];
  }

  String? get gender {
    return _localizedValues[locale.languageCode]!['gender'];
  }

  String? get documentation {
    return _localizedValues[locale.languageCode]!['documentation'];
  }

  String? get govtID {
    return _localizedValues[locale.languageCode]!['govtID'];
  }

  String? get upload {
    return _localizedValues[locale.languageCode]!['upload'];
  }

  String? get updateInfo {
    return _localizedValues[locale.languageCode]!['updateInfo'];
  }

  String? get instruction {
    return _localizedValues[locale.languageCode]!['instruction'];
  }

  String? get cod {
    return _localizedValues[locale.languageCode]!['cod'];
  }

  String? get store {
    return _localizedValues[locale.languageCode]!['store'];
  }

  String? get ready {
    return _localizedValues[locale.languageCode]!['ready'];
  }

  String? get storeText {
    return _localizedValues[locale.languageCode]!['storeText'];
  }

  String? get storeProfile {
    return _localizedValues[locale.languageCode]!['storeProfile'];
  }

  String? get top {
    return _localizedValues[locale.languageCode]!['top'];
  }

  String? get payment {
    return _localizedValues[locale.languageCode]!['payment'];
  }

  String? get service {
    return _localizedValues[locale.languageCode]!['service'];
  }

  String? get sub {
    return _localizedValues[locale.languageCode]!['sub'];
  }

  String? get total {
    return _localizedValues[locale.languageCode]!['total'];
  }

  String? get sales {
    return _localizedValues[locale.languageCode]!['sales'];
  }

  String? get tomato {
    return _localizedValues[locale.languageCode]!['tomato'];
  }

  String? get onion {
    return _localizedValues[locale.languageCode]!['onion'];
  }

  String? get fingers {
    return _localizedValues[locale.languageCode]!['fingers'];
  }

  String? get closingTime {
    return _localizedValues[locale.languageCode]!['closingTime'];
  }

  String? get openingTime {
    return _localizedValues[locale.languageCode]!['openingTime'];
  }

  String? get storeTimings {
    return _localizedValues[locale.languageCode]!['storeTimings'];
  }

  String? get storeAddress {
    return _localizedValues[locale.languageCode]!['storeAddress'];
  }

  String? get address {
    return _localizedValues[locale.languageCode]!['address'];
  }

  String? get category {
    return _localizedValues[locale.languageCode]!['category'];
  }

  String? get product {
    return _localizedValues[locale.languageCode]!['product'];
  }

  String? get stock {
    return _localizedValues[locale.languageCode]!['stock'];
  }

  String? get pending {
    return _localizedValues[locale.languageCode]!['pending'];
  }

  String? get item {
    return _localizedValues[locale.languageCode]!['item'];
  }

  String? get add {
    return _localizedValues[locale.languageCode]!['add'];
  }

  String? get edit {
    return _localizedValues[locale.languageCode]!['edit'];
  }

  String? get info {
    return _localizedValues[locale.languageCode]!['info'];
  }

  String? get title {
    return _localizedValues[locale.languageCode]!['title'];
  }

  String? get enterTitle {
    return _localizedValues[locale.languageCode]!['enterTitle'];
  }

  String? get itemCategory {
    return _localizedValues[locale.languageCode]!['itemCategory'];
  }

  String? get selectCategory {
    return _localizedValues[locale.languageCode]!['selectCategory'];
  }

  String? get price {
    return _localizedValues[locale.languageCode]!['price'];
  }

  String? get enterPrice {
    return _localizedValues[locale.languageCode]!['enterPrice'];
  }

  String? get quantity {
    return _localizedValues[locale.languageCode]!['quantity'];
  }

  String? get enterQuantity {
    return _localizedValues[locale.languageCode]!['enterQuantity'];
  }

  String? get addMore {
    return _localizedValues[locale.languageCode]!['addMore'];
  }

  String? get image {
    return _localizedValues[locale.languageCode]!['image'];
  }

  String? get newOrder {
    return _localizedValues[locale.languageCode]!['newOrder'];
  }

  String? get pastOrder {
    return _localizedValues[locale.languageCode]!['pastOrder'];
  }

  String? get vegetables {
    return _localizedValues[locale.languageCode]!['vegetables'];
  }

  String? get fruits {
    return _localizedValues[locale.languageCode]!['fruits'];
  }

  String? get herbs {
    return _localizedValues[locale.languageCode]!['herbs'];
  }

  String? get dairy {
    return _localizedValues[locale.languageCode]!['dairy'];
  }

  String? get items {
    return _localizedValues[locale.languageCode]!['items'];
  }

  String? get heyThere {
    return _localizedValues[locale.languageCode]!['heyThere'];
  }

  String? get onMyWay {
    return _localizedValues[locale.languageCode]!['onMyWay'];
  }

  String? get deliveryPartner {
    return _localizedValues[locale.languageCode]!['deliveryPartner'];
  }

  String? get orderNumber {
    return _localizedValues[locale.languageCode]!['orderNumber'];
  }

  String? get outStock {
    return _localizedValues[locale.languageCode]!['outStock'];
  }

  String? get display {
    return _localizedValues[locale.languageCode]!['display'];
  }

  String? get darkMode {
    return _localizedValues[locale.languageCode]!['darkMode'];
  }

  String? get darkText {
    return _localizedValues[locale.languageCode]!['darkText'];
  }

  String? get selectLanguage {
    return _localizedValues[locale.languageCode]!['language'];
  }

  String? get name1 {
    return _localizedValues[locale.languageCode]!['name1'];
  }

  String? get name2 {
    return _localizedValues[locale.languageCode]!['name2'];
  }

  String? get name3 {
    return _localizedValues[locale.languageCode]!['name3'];
  }

  String? get name4 {
    return _localizedValues[locale.languageCode]!['name4'];
  }

  String? get name5 {
    return _localizedValues[locale.languageCode]!['name5'];
  }

  String? get content1 {
    return _localizedValues[locale.languageCode]!['content1'];
  }

  String? get content2 {
    return _localizedValues[locale.languageCode]!['content2'];
  }

  String? get hey {
    return _localizedValues[locale.languageCode]!['hey'];
  }

  String? get or {
    return _localizedValues[locale.languageCode]!['or'];
  }

  String? get continueWith {
    return _localizedValues[locale.languageCode]!['continueWith'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get apple {
    return _localizedValues[locale.languageCode]!['apple'];
  }

  String? get settings {
    return _localizedValues[locale.languageCode]!['settings'];
  }

  String? get review {
    return _localizedValues[locale.languageCode]!['review'];
  }

  String? get setLocation {
    return _localizedValues[locale.languageCode]!['setLocation'];
  }

  String? get enterLocation {
    return _localizedValues[locale.languageCode]!['enterLocation'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get accepted {
    return _localizedValues[locale.languageCode]!['accepted'];
  }

  String? get lightText {
    return _localizedValues[locale.languageCode]!['lightText'];
  }

  String? get lightMode {
    return _localizedValues[locale.languageCode]!['lightMode'];
  }

  String? get englishh {
    return _localizedValues[locale.languageCode]!['englishh'];
  }

  String? get arabicc {
    return _localizedValues[locale.languageCode]!['arabicc'];
  }

  String? get frenchh {
    return _localizedValues[locale.languageCode]!['frenchh'];
  }

  String? get indonesiann {
    return _localizedValues[locale.languageCode]!['indonesiann'];
  }

  String? get portuguesee {
    return _localizedValues[locale.languageCode]!['portuguesee'];
  }

  String? get spanishh {
    return _localizedValues[locale.languageCode]!['spanishh'];
  }

  static List<Locale> getSupportedLocales() {
    List<Locale> toReturn = [];
    for (String langCode in AppConfig.languagesSupported.keys) {
      toReturn.add(Locale(langCode));
    }
    return toReturn;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppConfig.languagesSupported.keys.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
