import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/api_services.dart';
import 'package:movie_app/features/movie/presentation/manager/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  getMovies() {
    emit(GetMoviesLoading());

    try {
      ApiServices.getPopularMovies().then((value) {
        emit(GetMoviesSuccess(value!));
      });
    } catch (e) {
      emit(GetMoviesFailed(e.toString()));
    }
  }
}
