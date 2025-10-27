// To parse this JSON data, do
//
//     final productViewModel = productViewModelFromJson(jsonString);

import 'dart:convert';

ProductViewModel productViewModelFromJson(String str) => ProductViewModel.fromJson(json.decode(str));

String productViewModelToJson(ProductViewModel data) => json.encode(data.toJson());

class ProductViewModel {
  int id;
  String name;
  String extraNote;
  String category;
  dynamic brand;
  String description;
  String price;
  List<String> images;
  String sizes;
  String averageRating;
  int totalReviews;
  DateTime createdAt;
  List<dynamic> wishers;

  ProductViewModel({
    required this.id,
    required this.name,
    required this.extraNote,
    required this.category,
    required this.brand,
    required this.description,
    required this.price,
    required this.images,
    required this.sizes,
    required this.averageRating,
    required this.totalReviews,
    required this.createdAt,
    required this.wishers,
  });

  ProductViewModel copyWith({
    int? id,
    String? name,
    String? extraNote,
    String? category,
    dynamic brand,
    String? description,
    String? price,
    List<String>? images,
    String? sizes,
    String? averageRating,
    int? totalReviews,
    DateTime? createdAt,
    List<dynamic>? wishers,
  }) =>
      ProductViewModel(
        id: id ?? this.id,
        name: name ?? this.name,
        extraNote: extraNote ?? this.extraNote,
        category: category ?? this.category,
        brand: brand ?? this.brand,
        description: description ?? this.description,
        price: price ?? this.price,
        images: images ?? this.images,
        sizes: sizes ?? this.sizes,
        averageRating: averageRating ?? this.averageRating,
        totalReviews: totalReviews ?? this.totalReviews,
        createdAt: createdAt ?? this.createdAt,
        wishers: wishers ?? this.wishers,
      );

  factory ProductViewModel.fromJson(Map<String, dynamic> json) => ProductViewModel(
    id: json["id"],
    name: json["name"],
    extraNote: json["extra_note"],
    category: json["category"],
    brand: json["brand"],
    description: json["description"],
    price: json["price"],
    images: List<String>.from(json["images"].map((x) => x)),
    sizes: json["sizes"],
    averageRating: json["average_rating"],
    totalReviews: json["total_reviews"],
    createdAt: DateTime.parse(json["created_at"]),
    wishers: List<dynamic>.from(json["wishers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "extra_note": extraNote,
    "category": category,
    "brand": brand,
    "description": description,
    "price": price,
    "images": List<dynamic>.from(images.map((x) => x)),
    "sizes": sizes,
    "average_rating": averageRating,
    "total_reviews": totalReviews,
    "created_at": createdAt.toIso8601String(),
    "wishers": List<dynamic>.from(wishers.map((x) => x)),
  };
}
