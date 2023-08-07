class ProductModel{
  final int id;
  final String title;
  final String description;
  final num price;
  final double discountPercentage;
  final double ratings;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images; 
  
  ProductModel({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.price, 
    required this.discountPercentage, 
    required this.ratings, 
    required this.stock, 
    required this.brand, 
    required this.category, 
    required this.thumbnail, 
    required this.images,
    
  });
  // creating a factory constructor which helps us to create an instance of the class
  factory ProductModel.fromJson(Map<String, dynamic> json){
    final id = json['id'] as int;
    final title = json['title'] as String;
    final description = json['description'] as String;
    final price = json['price'] as num;
    final discountPercentage = json['discountPercentage'] as double;
    final ratings = json['rating'] as double;
    final stock = json['stock'] as int;
    final brand = json['brand'] as String;
    final category = json['category'] as String;  
    final thumbnail = json['thumbnail'] as String;
    final images = List<String>.from(json['images'] as List<dynamic>);

    return ProductModel(
      id: id,
      title: title,
      description: description,
      price: price,
      discountPercentage: discountPercentage,
      ratings: ratings,
      stock: stock,
      brand:  brand,
      category: category,
      thumbnail: thumbnail,
      images: images,
    );
  }
}