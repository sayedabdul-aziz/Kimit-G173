import 'data.dart';

class PostAuthResponse {
  Data? data;

  PostAuthResponse({this.data});

  factory PostAuthResponse.fromJson(Map<String, dynamic> json) {
    return PostAuthResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
