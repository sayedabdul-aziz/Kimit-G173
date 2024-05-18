import 'category.dart';
import 'links.dart';
import 'meta.dart';

class Data {
  List<Category>? categories;
  Meta? meta;
  Links? links;

  Data({this.categories, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'meta': meta?.toJson(),
        'links': links?.toJson(),
      };
}
