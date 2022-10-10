import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository _authRepository = instance<AuthRepository>();
  UserCubit() : super(UserInitial());

  Future<bool> updateUser({
    String? userId,
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
  }) async {
    bool success = await _authRepository.updateUserProfile(
        userId: userId!,
        name: name,
        phoneNumber: phoneNumber,
        photoUrl: photoUrl,
        email: email);
    return success;
  }
}
