import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/OrderTableItemAccount/order_table_item_account.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/models/ratings.dart';
import 'package:hungerz_store/models/shop.dart';

class AuthProvider {
  static String phone = "";
  static String phoneNumber = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  DocumentReference? firestoreDocRefFromJson(dynamic value) {
    if (value is DocumentReference) {
      return FirebaseFirestore.instance.doc(value.path);
    } else if (value is String) {
      return FirebaseFirestore.instance.doc(value);
    }
    return null;
  }

  getOtp(String phoneNumber, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        AuthProvider.phone = verificationId;
        AuthProvider.phoneNumber = phoneNumber;
        Navigator.pushNamed(context, PageRoutes.verification);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  otpVerfication(String smsCode, BuildContext context,
      [bool mounted = true]) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: AuthProvider.phone,
        smsCode: smsCode,
      );
      // Sign the user in (or link) with the credential
      final UserCredential userCredentials =
          await auth.signInWithCredential(credential);
      if (!mounted) return;
      setUserCredentials(userCredentials, context);
    } catch (e) {
      log("error $e");
    }
  }

  setUserCredentials(final UserCredential userCredentials, BuildContext context,
      [bool mounted = true]) async {
    log('USER CREDENTIAL $userCredentials');

    if (userCredentials.user == null) {
      throw '!USER';
    }
    final String userId = userCredentials.user!.uid;
    log("user iddddd $userId");
    //final String userId = FirebaseAuth.instance.currentUser!.uid;
    await _appPreferences.setUserId(userId);

    if (userCredentials.additionalUserInfo!.isNewUser) {
      await _startUserProfile(
        userId: userId,
        phoneNumber: userCredentials.user!.phoneNumber!,
      );
      if (!mounted) return;
      Navigator.pushNamed(context, PageRoutes.registration);
    }
    if (!userCredentials.additionalUserInfo!.isNewUser) {
      if (!mounted) return;
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const OrderItemAccount(),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> fetchShopDataAndReference(
      {required String userId}) async {
    final doc = FirebaseFirestore.instance.collection('shops').doc(userId);

    final snapshot = await doc.get();

    return {
      'docSnapshot': snapshot,
      'docReference': doc,
    };
  }

  Future<Map<String, dynamic>> fetchShopProfile({
    required String userId,
  }) async {
    final data = await fetchShopDataAndReference(userId: userId);
    final DocumentSnapshot docSnapshot = data['docSnapshot'];
    final DocumentReference docReference = data['docReference'];

    if (!docSnapshot.exists) {
      return {};
    }

    return {
      'docData': docSnapshot.data() as Map<String, dynamic>,
      'docReference': docReference,
    };
  }

  Future<void> _startUserProfile({
    required String userId,
    String? name,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) async {
    var uuid = await _appPreferences.getUserID();
    log("User Id uuid $uuid");
    final DocumentReference user =
        FirebaseFirestore.instance.collection('shops').doc(uuid);

    user.set({
      'name': name ?? '',
      'email': email ?? '',
      'phoneNumber': phoneNumber ?? '',
      'walletBalance': 0.0,
      'isRetailer': true,
      'imageUrl': imageUrl ?? ""
    });
  }

  Future<bool> updateShopProfile(
      {String? address,
      String? email,
      String? name,
      double? latitude,
      longitude,
      String? description,
      String? imageUrl,
      bool? isPopular,
      Ratings? ratings,
      required String phoneNumber,
      required String categoryId}) async {
    try {
      var uuid = await _appPreferences.getUserID();

      final DocumentReference shopp =
          FirebaseFirestore.instance.collection('shops').doc(uuid);
      Shop shop = Shop(
          phoneNumber: phoneNumber,
          email: email,
          address: address,
          name: name,
          latitude: latitude ?? 12.011,
          longitude: longitude ?? 41.1211,
          description: description,
          imageUrl: imageUrl,
          isPopular: isPopular,
          category: firestoreDocRefFromJson("/categories/$categoryId"));

      shopp.set(shop.toJson());
      await _appPreferences.setshopName(name!);

      return true;
    } catch (error) {
      rethrow;
    }
  }
}
