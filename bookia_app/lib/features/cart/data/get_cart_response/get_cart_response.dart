import 'package:bookia_app/features/cart/data/get_cart_response/datum.dart';

class GetCartResponse {
  List<CartModel>? data;

  GetCartResponse({this.data});

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
