import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/login_navigator.dart';

class AuthProvider {
  static String phone = "";
  static String phoneNumber = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  getOtp(String phoneNumber, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        AuthProvider.phone = verificationId;
        AuthProvider.phoneNumber = phoneNumber;
        Navigator.pushNamed(context, LoginRoutes.registration);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  otpVerfication(String smsCode, VoidCallback onVerificationDone) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: AuthProvider.phone,
        smsCode: smsCode,
      );
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      onVerificationDone();
    } catch (e) {
      log("error $e");
    }
  }
}
