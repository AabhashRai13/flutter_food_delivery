import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository _authRepository = instance<AuthRepository>();
  UserCubit() : super(UserInitial());

  Future<bool> updateShop({
    String? address,
    String? name,
    double? latitude,
    longitude,
    String? description,
    String? imageUrl,
    bool? isPopular,
    required String phoneNumber,
  }) async {
    bool success = await _authRepository.updateShopProfile(
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        description: description,
        imageUrl: imageUrl,
        isPopular: isPopular,
        phoneNumber: phoneNumber);
    return success;
  }
}
