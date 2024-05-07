import 'package:bookia_app/features/home/data/model/get_book_response/get_book_response.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

// getBooks

class GetBooksLoading extends HomeStates {}

class GetBooksSuccess extends HomeStates {
  final GetBookResponse getBookResponse;
  GetBooksSuccess(this.getBookResponse);
}

class GetBooksError extends HomeStates {
  final String error;
  GetBooksError(this.error);
}
