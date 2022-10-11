import 'package:hungerz_store/data/network/auth.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  AuthRepository();

  Future<bool> updateShopProfile({
    String? address,
    String? name,
    double? latitude,
    longitude,
    String? description,
    String? imageUrl,
    bool? isPopular,
    required String phoneNumber,
  }) async {
    try {
      bool success = await _authProvider.updateShopProfile(
          address: address,
          name: name,
          latitude: latitude,
          longitude: longitude,
          description: description,
          imageUrl: imageUrl,
          isPopular: isPopular,
          phoneNumber: phoneNumber
          );
      return success;
    } catch (error) {
      rethrow;
    }
  }
}
