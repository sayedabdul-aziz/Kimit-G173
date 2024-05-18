import 'package:bookia_app/features/home/data/model/get_products_response/product.dart';

class Data {
  int? id;
  String? name;
  String? slug;
  List<Product>? products;

  Data({this.id, this.name, this.slug, this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
