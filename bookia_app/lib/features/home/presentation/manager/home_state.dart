import 'package:bookia_app/features/cart/data/get_cart_response/get_cart_response.dart';
import 'package:bookia_app/features/home/data/model/get_all_gategories_response/get_all_gategories_response.dart';
import 'package:bookia_app/features/home/data/model/get_category_details_response/get_category_details_response.dart';
import 'package:bookia_app/features/home/data/model/get_products_response/get_products_response.dart';
import 'package:bookia_app/features/home/data/model/get_sliders_response/get_sliders_response.dart';
import 'package:bookia_app/features/wishlist/data/get_wishlist_response/get_wishlist_response.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

//* -------- Books -------------

class GetBooksLoading extends HomeStates {}

class GetBooksSuccess extends HomeStates {
  final GetProductsResponse getBookResponse;
  GetBooksSuccess(this.getBookResponse);
}

class GetBooksError extends HomeStates {
  final String error;
  GetBooksError(this.error);
}

class GetAllCategoriesLoading extends HomeStates {}

class GetAllCategoriesSuccess extends HomeStates {
  final GetAllGategoriesResponse getAllGategoriesResponse;
  GetAllCategoriesSuccess(this.getAllGategoriesResponse);
}

class GetAllCategoriesError extends HomeStates {
  final String error;
  GetAllCategoriesError(this.error);
}

class GetCategoryDetailsLoading extends HomeStates {}

class GetCategoryDetailsSuccess extends HomeStates {
  final GetCategoryDetailsResponse getAllGategoriesResponse;
  GetCategoryDetailsSuccess(this.getAllGategoriesResponse);
}

class GetCategoryDetailsError extends HomeStates {
  final String error;
  GetCategoryDetailsError(this.error);
}

class GetSlidersLoading extends HomeStates {}

class GetSlidersSuccess extends HomeStates {
  final GetSlidersResponse getSlidersResponse;
  GetSlidersSuccess(this.getSlidersResponse);
}

class GetSlidersError extends HomeStates {
  final String error;
  GetSlidersError(this.error);
}

//* -------- Wishlist Books -------------
class AddToFavLoading extends HomeStates {}

class AddToFavSuccess extends HomeStates {}

class AddToFavError extends HomeStates {
  final String error;
  AddToFavError(this.error);
}

class RemoveFromFavLoading extends HomeStates {}

class RemoveFromFavSuccess extends HomeStates {}

class RemoveFromFavError extends HomeStates {
  final String error;
  RemoveFromFavError(this.error);
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
  RemoveFromCartSuccess();
}

class RemoveFromCartError extends HomeStates {
  final String error;
  RemoveFromCartError(this.error);
}

class UpdateCartLoading extends HomeStates {}

class UpdateCartSuccess extends HomeStates {
  UpdateCartSuccess();
}

class UpdateCartError extends HomeStates {
  final String error;
  UpdateCartError(this.error);
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
