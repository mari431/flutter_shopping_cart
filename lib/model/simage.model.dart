class SImage {
  const SImage({
    required this.id,
    required this.assetImage,
    required this.description,
    required this.price,
    required this.name,
  });

  final String id;
  final String assetImage;
  final String description;
  final String price;
  final String name;

  factory SImage.fromJson(Map<String, dynamic> json) {
    return SImage(
      id: json['id'] as String,
      assetImage: json['assetImage'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      name: json['name'] as String,
    );
  }
}