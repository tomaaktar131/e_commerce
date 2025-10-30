class ReviewModel {
  final int id;
  final ReviewUser user;
  final int productId;
  final double rating;
  final String comment;
  final String createdAt;

  ReviewModel({
    required this.id,
    required this.user,
    required this.productId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      user: ReviewUser.fromJson(json['user']),
      productId: json['product']['id'],
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      comment: json['comment'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}

class ReviewUser {
  final int id;
  final String firstName;
  final String email;
  final String phone;
  final String country;
  final String city;
  final String address;
  final String image;

  ReviewUser({
    required this.id,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.country,
    required this.city,
    required this.address,
    required this.image,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
