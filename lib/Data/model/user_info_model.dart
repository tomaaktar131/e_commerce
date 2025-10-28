import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  final String firstName;
  final String email;
  final String? phone;
  final String? country;
  final String? city;
  final String? address;
  final String? image;

  UserInfoModel({
    required this.firstName,
    required this.email,
    this.phone,
    this.country,
    this.city,
    this.address,
    this.image,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    firstName: json["first_name"] ?? "",
    email: json["email"] ?? "",
    phone: json["phone"],
    country: json["country"],
    city: json["city"],
    address: json["address"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "email": email,
    "phone": phone,
    "country": country,
    "city": city,
    "address": address,
    "image": image,
  };
}
