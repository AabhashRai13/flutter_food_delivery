import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/models/ratings.dart';
import 'package:hungerz_store/models/shop.dart';
import 'package:hungerz_store/repositories/shop_repository.dart';
import 'package:hungerz_store/repositories/user_repository.dart';
import '../../models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository _authRepository = instance<AuthRepository>();
  final ShopRepository _shopRepository = instance<ShopRepository>();

  UserCubit() : super(UserInitial());
  String? shopName;
  List<RatingsWithUser> ratings = <RatingsWithUser>[];
  Future<bool> updateShop(
      {String? address,
      String? name,
      double? latitude,
      longitude,
      String? description,
      String? imageUrl,
      bool? isPopular,
      String? email,
      required String phoneNumber,
      required String categoryId}) async {
    bool success = await _authRepository.updateShopProfile(
        email: email,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        description: description,
        imageUrl: imageUrl,
        isPopular: isPopular,
        phoneNumber: phoneNumber,
        categoryId: categoryId);
    return success;
  }

  fetchShopProfile() async {
    ratings.clear();
    final data = await _shopRepository.fetchShopProfile();
    final shopProfileData = data['docData'];
    shopName = Shop.fromJson(shopProfileData).name;
    emit(ShopLoaded(shop: Shop.fromJson(shopProfileData)));
    fetchUserFromRatings(Shop.fromJson(shopProfileData));
  }

  fetchUserFromRatings(Shop shop) async {
    if (shop.ratings == null) return;
    for (var rating in shop.ratings!) {
      final data = await _shopRepository.getUserFromOrder(rating.userId!);
      ratings.add(RatingsWithUser(ratings: rating, user: data));
    }
  }
}

class RatingsWithUser {
  Ratings? ratings;
  Users? user;
  RatingsWithUser({this.ratings, this.user});
}
