class BrandViewModel {
  final int id;
  final String name;
  final String? brandImage;

  BrandViewModel({
    required this.id,
    required this.name,
    this.brandImage,
  });

  factory BrandViewModel.fromJson(Map<String, dynamic> json) {
    return BrandViewModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      brandImage: json['brand_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand_image': brandImage ?? '',
    };
  }
}
