class TermsAndServicesModel {
  final int id;
  final String heading;
  final String description;

  TermsAndServicesModel({
    required this.id,
    required this.heading,
    required this.description,
  });

  factory TermsAndServicesModel.fromJson(Map<String, dynamic> json) {
    return TermsAndServicesModel(
      id: json['id'],
      heading: json['heading'],
      description: json['discription'], // note: key name in JSON is 'discription'
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'heading': heading,
      'discription': description,
    };
  }
}
