enum ProductType { seeds, plant, unknown }

enum PackType { volume, weight, unknown }

class Product {
  String id;
  String name;
  PackType packType;
  ProductType productType;
  List<String> packs;
  int price;

  List<String>? photoUrls;
  List<String>? description;

  Product({
    required this.id,
    required this.name,
    required this.packType,
    required this.packs,
    required this.price,
    required this.productType,
    this.photoUrls,
    this.description,
  });

  factory Product.fromJson(String id, Map<String, dynamic> json) {
    return Product(
      id: id,
      name: json['name'],
      packType: packTypeResolver(json['pack_type']),
      packs: (json['packs'] as List).cast<String>(),
      price: json['price'],
      productType: productTypeResolver(json['product_type']),
      photoUrls: (json['photo_url'] as List).cast<String>(),
      description: (json['description'] as List).cast<String>(),
    );
  }

  static PackType packTypeResolver(String packType) {
    switch (packType) {
      case 'weight':
        return PackType.weight;
      case 'volume':
        return PackType.volume;
      default:
        return PackType.unknown;
    }
  }

  static String packTypTextResolver(PackType type) {
    switch (type) {
      case PackType.weight:
        return 'г';
      case PackType.volume:
        return 'мл';
      default:
        return '';
    }
  }

  static ProductType productTypeResolver(String productType) {
    switch (productType) {
      case 'plant':
        return ProductType.plant;
      case 'seeds':
        return ProductType.seeds;
      default:
        return ProductType.unknown;
    }
  }
}
