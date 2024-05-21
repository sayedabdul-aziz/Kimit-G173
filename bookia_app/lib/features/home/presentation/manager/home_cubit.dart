import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/api_services.dart';
import 'package:bookia_app/core/services/local_services.dart';
import 'package:bookia_app/features/cart/data/get_cart_response/get_cart_response.dart';
import 'package:bookia_app/features/home/data/model/get_all_gategories_response/get_all_gategories_response.dart';
import 'package:bookia_app/features/home/data/model/get_category_details_response/get_category_details_response.dart';
import 'package:bookia_app/features/home/data/model/get_products_response/get_products_response.dart';
import 'package:bookia_app/features/home/data/model/get_sliders_response/get_sliders_response.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/wishlist/data/get_wishlist_response/get_wishlist_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  late GetProductsResponse getBookResponse;
  late GetSlidersResponse slidersResponse;
  // get books
  getBooks() async {
    emit(GetBooksLoading());
    try {
      ApiServices.get(endPoint: 'products').then((value) {
        var res = GetProductsResponse.fromJson(value);
        getBookResponse = res;
        emit(GetBooksSuccess(res));
      });
    } catch (e) {
      emit(GetBooksError(e.toString()));
    }
  }

  getSliders() async {
    emit(GetSlidersLoading());
    try {
      ApiServices.get(endPoint: 'sliders').then((value) {
        var res = GetSlidersResponse.fromJson(value);
        slidersResponse = res;
        emit(GetSlidersSuccess(res));
      });
    } catch (e) {
      emit(GetSlidersError(e.toString()));
    }
  }

  // categories
  getAllCategories() async {
    emit(GetAllCategoriesLoading());
    try {
      ApiServices.get(endPoint: 'categories').then((value) {
        var res = GetAllGategoriesResponse.fromJson(value);
        emit(GetAllCategoriesSuccess(res));
      });
    } catch (e) {
      emit(GetAllCategoriesError(e.toString()));
    }
  }

  // categories
  getBooksByCategory(String id) async {
    emit(GetCategoryDetailsLoading());
    try {
      ApiServices.get(endPoint: 'categories/$id').then((value) {
        var res = GetCategoryDetailsResponse.fromJson(value);
        emit(GetCategoryDetailsSuccess(res));
      });
    } catch (e) {
      emit(GetCategoryDetailsError(e.toString()));
    }
  }

  //* ------------------- wishlist logic
  // add to wishlist
  addToFav(int bookId) {
    emit(AddToFavLoading());

    try {
      ApiServices.post(
        endPoint: 'add-to-wishlist',
        query: {
          'product_id': bookId,
        },
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
          // langugae
          // contentType
        },
      ).then((value) {
        emit(AddToFavSuccess());
      });
    } catch (e) {
      emit(AddToFavError(e.toString()));
    }
  }

  removeFromWishList(int bookId) {
    emit(RemoveFromFavLoading());

    try {
      ApiServices.post(
        endPoint: 'remove-from-wishlist',
        query: {
          'product_id': bookId,
        },
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(RemoveFromFavSuccess());
      });
    } catch (e) {
      emit(RemoveFromFavError(e.toString()));
    }
  }

  // get wishlist
  getWishlist() {
    emit(GetWishlistLoading());
    try {
      ApiServices.get(
        endPoint: 'wishlist',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
          // langugae
          // contentType
        },
      ).then((value) {
        emit(GetWishlistSuccess(GetWishListResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetWishlistError(e.toString()));
    }
  }

  //* -------------- Cart ------------------------

  addToCart(int bookId) {
    emit(AddToCartLoading());

    try {
      ApiServices.post(
        endPoint: 'add-to-cart',
        query: {
          'product_id': bookId,
        },
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(AddToCartSuccess());
      });
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }

  updateCart(int cartId, int quantity) {
    emit(UpdateCartLoading());

    try {
      ApiServices.post(
        endPoint: 'update-cart',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
        query: {
          'cart_item_id': cartId.toString(),
          'quantity': quantity.toString(),
        },
      ).then((value) {
        emit(UpdateCartSuccess());
      });
    } catch (e) {
      emit(UpdateCartError(e.toString()));
    }
  }

  removeFromCart(int cartId) {
    emit(RemoveFromCartLoading());

    try {
      ApiServices.post(
        endPoint: 'remove-from-cart',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
        query: {
          'cart_item_id': cartId.toString(),
        },
      ).then((value) {
        emit(RemoveFromCartSuccess());
      });
    } catch (e) {
      emit(RemoveFromCartError(e.toString()));
    }
  }

  // get wishlist
  getCart() {
    emit(GetCartLoading());
    try {
      ApiServices.get(
        endPoint: 'cart',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(GetCartSuccess(GetCartResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetCartError(e.toString()));
    }
  }

  // order details
  placeOrder(
      {required String name,
      required String email,
      required String phone,
      required String governorateId,
      required String address}) {
    emit(PlaceOrderLoading());
    try {
      ApiServices.post(
        endPoint: 'place-order',
        query: {
          'name': name,
          'email': email,
          'phone': phone,
          'governorate_id': governorateId,
          'address': address
        },
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(PlaceOrderSuccess());
      });
    } catch (e) {
      emit(PlaceOrderError(e.toString()));
    }
  }
}
