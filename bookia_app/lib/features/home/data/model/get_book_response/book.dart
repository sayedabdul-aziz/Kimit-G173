class Book {
  int? id;
  String? title;
  String? category;
  String? description;
  String? price;
  String? image;

  Book({
    this.id,
    this.title,
    this.category,
    this.description,
    this.price,
    this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'] as int?,
        title: json['title'] as String?,
        category: json['category'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'description': description,
        'price': price,
        'image': image,
      };
}
