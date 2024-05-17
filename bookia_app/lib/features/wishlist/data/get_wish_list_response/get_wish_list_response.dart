import 'datum.dart';

class GetWishListResponse {
  List<WishlistItem>? data;

  GetWishListResponse({this.data});

  factory GetWishListResponse.fromJson(Map<String, dynamic> json) {
    return GetWishListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WishlistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
