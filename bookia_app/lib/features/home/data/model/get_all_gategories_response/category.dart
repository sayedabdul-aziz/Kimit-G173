class Category {
  int? id;
  String? name;
  int? productsCount;

  Category({this.id, this.name, this.productsCount});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        productsCount: json['products_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'products_count': productsCount,
      };
}
