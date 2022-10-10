import 'package:hungerz_store/data/network/auth.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  AuthRepository();

  Future<bool> updateUserProfile({
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    required String userId,
  }) async {
    try {
      bool success = await _authProvider.updateUserProfile(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          photoUrl: photoUrl,
          userId: userId);
      return success;
    } catch (error) {
      rethrow;
    }
  }
}
