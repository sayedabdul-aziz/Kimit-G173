import 'package:movie_app/features/auth/data/models/movie_model.dart';

class MovieState {}

class MovieInitial extends MovieState {}

// get movies

class GetMoviesLoading extends MovieState {}

class GetMoviesSuccess extends MovieState {
  final MovieModel movieModel;

  GetMoviesSuccess(this.movieModel);
}

class GetMoviesFailed extends MovieState {
  final String message;

  GetMoviesFailed(this.message);
}
