class Order {
  final String? id;
  final String? user;
  final String? description;
  final String? imageUrl;
  final double? totalPrice;
  final String? address;
  final double? lat;
  final double? lng;
  final dynamic reference;
  final bool? isPopular;
  final String? categoryName;
  final dynamic rating;
  final dynamic products;
  final DateTime createdAt;
  final String? status;

  const Order(
      {this.status,
      required this.createdAt,
      this.id,
      this.user,
      this.description,
      this.imageUrl,
      this.totalPrice,
      this.address,
      this.lat,
      this.lng,
      this.reference,
      this.isPopular,
      this.categoryName,
      this.rating,
      this.products});
}
