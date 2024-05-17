import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/api_services.dart';
import 'package:bookia_app/core/services/local_services.dart';
import 'package:bookia_app/features/cart/data/get_cart_response/get_cart_response.dart';
import 'package:bookia_app/features/home/data/model/get_book_response/get_book_response.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/wishlist/data/get_wish_list_response/get_wish_list_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  late GetBookResponse getBookResponse;

  // get books
  getBooks() async {
    emit(GetBooksLoading());
    try {
      ApiServices.get(endPoint: 'books?page=1').then((value) {
        var res = GetBookResponse.fromJson(value);
        getBookResponse = res;
        emit(GetBooksSuccess(res));
      });
    } catch (e) {
      emit(GetBooksError(e.toString()));
    }
  }

  //*  wishlist logic
  // add to wishlist
  addToFav(int bookId) {
    emit(AddToFavLoading());

    try {
      ApiServices.post(
        endPoint: 'wishlist/add',
        query: {
          'bookId': bookId,
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

  // get wishlist
  getWishlist() {
    emit(GetWishlistLoading());
    try {
      ApiServices.get(
        endPoint: 'wishlist/get',
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

  addToCart(int bookId) {
    emit(AddToCartLoading());

    try {
      ApiServices.post(
        endPoint: 'cart',
        query: {
          'bookId': bookId,
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

  removeFromCart(int bookId) {
    emit(RemoveFromCartLoading());

    try {
      ApiServices.delete(
        endPoint: 'cart/$bookId',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getCachedData(ktoken)}',
        },
      ).then((value) {
        emit(RemoveFromCartSuccess(
          GetCartResponse.fromJson(value),
        ));
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
}
