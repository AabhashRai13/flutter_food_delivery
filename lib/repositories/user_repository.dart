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
    String? email,
    required String phoneNumber,
    required String categoryId
  }) async {
    try {
      bool success = await _authProvider.updateShopProfile(
        email: email,
          address: address,
          name: name,
          latitude: latitude,
          longitude: longitude,
          description: description,
          imageUrl: imageUrl,
          isPopular: isPopular,
          phoneNumber: phoneNumber,
          categoryId:categoryId
          );
      return success;
    } catch (error) {
      rethrow;
    }
  }
}
