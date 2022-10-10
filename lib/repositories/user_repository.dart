import 'package:hungerz_store/data/network/auth.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  AuthRepository();

  Future<void> updateUserProfile({
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    required String userId,
  }) async {
    try {
      await _authProvider.updateUserProfile(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          photoUrl: photoUrl,
          userId: userId);
    } catch (error) {
      rethrow;
    }
  }
}
