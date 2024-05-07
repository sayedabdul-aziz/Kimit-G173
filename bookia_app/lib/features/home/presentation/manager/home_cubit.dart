import 'package:bookia_app/core/services/api_services.dart';
import 'package:bookia_app/features/home/data/model/get_book_response/get_book_response.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  // get books
  getBooks() async {
    emit(GetBooksLoading());
    try {
      ApiServices.get(endPoint: 'books?page=1').then((value) {
        var res = GetBookResponse.fromJson(value);
        emit(GetBooksSuccess(res));
      });
    } catch (e) {
      emit(GetBooksError(e.toString()));
    }
  }
}
