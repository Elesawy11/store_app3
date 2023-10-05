class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;

  final String category;
  final String image;
  
  ProductModel({
    
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
     
    );
  }
}

class Rating {
  final dynamic rate;
  final dynamic count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(json) {
    return Rating(rate: json['rate'], count: json['count']);
  }
}
