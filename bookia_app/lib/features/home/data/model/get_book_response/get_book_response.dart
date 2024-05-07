import 'book.dart';
import 'links.dart';
import 'meta.dart';

class GetBookResponse {
  List<Book>? data;
  Links? links;
  Meta? meta;

  GetBookResponse({this.data, this.links, this.meta});

  factory GetBookResponse.fromJson(Map<String, dynamic> json) {
    return GetBookResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
