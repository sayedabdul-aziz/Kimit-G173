class WishlistItem {
  int? id;
  String? title;
  String? category;
  String? description;
  String? price;
  String? image;

  WishlistItem({
    this.id,
    this.title,
    this.category,
    this.description,
    this.price,
    this.image,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) => WishlistItem(
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
