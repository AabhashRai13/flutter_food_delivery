import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/Registration/UI/register_page.dart';
import 'package:hungerz_store/Auth/login_navigator.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';

class AuthProvider {
  static String phone = "";
  static String phoneNumber = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  getOtp(String phoneNumber, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        AuthProvider.phone = verificationId;
        AuthProvider.phoneNumber = phoneNumber;
        Navigator.pushNamed(context, LoginRoutes.verification);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  otpVerfication(String smsCode, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: AuthProvider.phone,
        smsCode: smsCode,
      );
      // Sign the user in (or link) with the credential
      final UserCredential userCredentials =
          await auth.signInWithCredential(credential);
      setUserCredentials(userCredentials);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPage()),
      );
    } catch (e) {
      log("error $e");
    }
  }

  setUserCredentials(final UserCredential userCredentials) async {
    log('USER CREDENTIAL $userCredentials');

    if (userCredentials.user == null) {
      throw '!USER';
    }

    final String userId = FirebaseAuth.instance.currentUser!.uid;
    await _appPreferences.setUserId(userId);
    if (userCredentials.additionalUserInfo!.isNewUser) {
      await _startUserProfile(
        userId: userId,
        phoneNumber: userCredentials.user!.phoneNumber!,
      );
    }
  }
  //  Future<Map<String, dynamic>> fetchUserProfile(
  //     {required String userId}) async {
  //   final doc = FirebaseFirestore.instance.collection('users').doc(userId);

  //   final snapshot = await doc.get();

  //   return {
  //     'docSnapshot': snapshot,
  //     'docReference': doc,
  //   };
  // }
  //  Future<Map<String, dynamic>> fetchUserProfile({
  //   required String userId,
  // }) async {
  //   final data = await fetchUserProfile(userId: userId);
  //   final DocumentSnapshot docSnapshot = data['docSnapshot'];
  //   final DocumentReference docReference = data['docReference'];

  //   if (!docSnapshot.exists) {
  //     return {};
  //   }

  //   return {
  //     'docData': docSnapshot.data() as Map<String, dynamic>,
  //     'docReference': docReference,
  //   };
  // }

  // Future<void> _fetchUserProfile() async {
  //   final data = await fetchUserProfile(
  //     userId: state.user.id,
  //   );

  //   final userProfileData = data['docData'];
  //   final List<UserTransaction> transactions = [];

  //   print('DATA_TRANSACTION ${userProfileData['transaction']}');
  //   print('DATA_WALLET_BALANCE ${userProfileData['walletBalance']}');

  //   if (userProfileData['transaction'] != null) {
  //     for (dynamic transaction in userProfileData['transaction']) {
  //       transactions.add(UserTransaction.fromMap(transaction));
  //     }
  //   }

  //   emit(
  //     state.copyWith(
  //       user: state.user.copyWith(
  //         name: userProfileData['name'],
  //         email: userProfileData['email'],
  //         phoneNumber: userProfileData['phoneNumber'],
  //         photoUrl: userProfileData['photoUrl'],
  //         address: userProfileData['address'],
  //         addressType: userProfileData['addressType'],
  //         latitude: userProfileData['latitude'],
  //         longitude: userProfileData['longitude'],
  //         walletBalance: userProfileData['walletBalance'],
  //         firestoreDocReference: data['docReference'],
  //         transactions: transactions,
  //       ),
  //     ),
  //   );
  // }

  Future<void> _startUserProfile({
    required String userId,
    String? name,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) async {
    final DocumentReference user =
        FirebaseFirestore.instance.collection('users').doc(userId);

    user.set({
      'name': name ?? '',
      'email': email ?? '',
      'phoneNumber': phoneNumber ?? '',
      'walletBalance': 0.0,
      'isRetailer': true,
      'imageUrl': imageUrl ?? ""
    });
  }

  Future<void> updateUserProfile({
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    required String userId,
  }) async {
    try {
      final DocumentReference user =
          FirebaseFirestore.instance.collection('users').doc(userId);

      user.set({
        'name': name ?? '',
        'email': email ?? '',
        'phoneNumber': phoneNumber ?? '',
        'imageUrl': photoUrl,
        'walletBalance': 0.0,
        'isRetailer': true,
      });
    } catch (error) {
      rethrow;
    }
  }
}
