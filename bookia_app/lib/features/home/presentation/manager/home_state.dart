import 'package:bookia_app/features/cart/data/get_cart_response/get_cart_response.dart';
import 'package:bookia_app/features/home/data/model/get_book_response/get_book_response.dart';
import 'package:bookia_app/features/wishlist/data/get_wish_list_response/get_wish_list_response.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

//* -------- Books -------------

class GetBooksLoading extends HomeStates {}

class GetBooksSuccess extends HomeStates {
  final GetBookResponse getBookResponse;
  GetBooksSuccess(this.getBookResponse);
}

class GetBooksError extends HomeStates {
  final String error;
  GetBooksError(this.error);
}

//* -------- Wishlist Books -------------
class AddToFavLoading extends HomeStates {}

class AddToFavSuccess extends HomeStates {}

class AddToFavError extends HomeStates {
  final String error;
  AddToFavError(this.error);
}

class GetWishlistLoading extends HomeStates {}

class GetWishlistSuccess extends HomeStates {
  final GetWishListResponse getWishListResponse;
  GetWishlistSuccess(this.getWishListResponse);
}

class GetWishlistError extends HomeStates {
  final String error;
  GetWishlistError(this.error);
}

//* -------- Cart -------------

class AddToCartLoading extends HomeStates {}

class AddToCartSuccess extends HomeStates {}

class AddToCartError extends HomeStates {
  final String error;
  AddToCartError(this.error);
}

class RemoveFromCartLoading extends HomeStates {}

class RemoveFromCartSuccess extends HomeStates {
  final GetCartResponse getCartResponse;
  RemoveFromCartSuccess(this.getCartResponse);
}

class RemoveFromCartError extends HomeStates {
  final String error;
  RemoveFromCartError(this.error);
}

class GetCartLoading extends HomeStates {}

class GetCartSuccess extends HomeStates {
  final GetCartResponse getCartResponse;
  GetCartSuccess(this.getCartResponse);
}

class GetCartError extends HomeStates {
  final String error;
  GetCartError(this.error);
}
