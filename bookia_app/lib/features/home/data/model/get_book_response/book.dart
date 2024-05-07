class Book {
  String? title;
  String? category;
  String? description;
  String? price;
  String? image;

  Book({
    this.title,
    this.category,
    this.description,
    this.price,
    this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json['title'] as String?,
        category: json['category'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'description': description,
        'price': price,
        'image': image,
      };
}
