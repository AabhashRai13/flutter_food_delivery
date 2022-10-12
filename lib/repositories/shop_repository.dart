import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/data/network/auth.dart';

class ShopRepository {
  final AuthProvider _authDataProvider = AuthProvider();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Future<Map<String, dynamic>> fetchShopProfile() async {
    var uuid = await _appPreferences.getUserID();
    log("uuid $uuid");
    final data = await _authDataProvider.fetchShopProfile(userId: uuid!);

    final docSnapshot = data['docData'];
    final DocumentReference docReference = data['docReference'];

    // if (!docSnapshot.exists) {
    //   return {};
    // }

    return {
      'docData': docSnapshot as Map<String, dynamic>,
      'docReference': docReference,
    };
  }

  // Future<void> updateUserProfile({
  //   String? name,
  //   String? email,
  //   String? phoneNumber,
  //   String? photoUrl,
  //   required String userId,
  // }) async {
  //   try {
  //     await _authDataProvider.updateUserProfile(
  //         name: name,
  //         email: email,
  //         phoneNumber: phoneNumber,
  //         photoUrl: photoUrl,
  //         userId: userId);
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // Future<void> updateUserLocation({
  //   required String address,
  //   required String addressType,
  //   required double latitude,
  //   required double longitude,
  //   required String userId,
  // }) async {
  //   try {
  //     await _authDataProvider.updateUserLocation(
  //         address: address,
  //         addressType: addressType.toUpperCase(),
  //         latitude: latitude,
  //         longitude: longitude,
  //         userId: userId);
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // Future<String> updateUserProfilePicture({
  //   required File image,
  //   required String fileName,
  // }) async {
  //   final String imageUrl = await _authDataProvider.updateUserProfilePicture(
  //     image: image,
  //     fileName: fileName,
  //   );

  //   return imageUrl;
  // }

}
