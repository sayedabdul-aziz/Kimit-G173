import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/utils/app_text_styles.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/movie/presentation/manager/movie_cubit.dart';
import 'package:movie_app/features/movie/presentation/manager/movie_state.dart';
import 'package:movie_app/features/movie/presentation/views/movie_details_view.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  void initState() {
    context.read<MovieCubit>().getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie'),
        ),
        body: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
          if (state is GetMoviesSuccess) {
            var movies = state.movieModel.results;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Scrollbar(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 270),
                  itemCount: movies?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailsView(
                                      movie: movies![index],
                                    )));
                      },
                      child: Container(
                        height: 270, // use to use expanded

                        decoration: BoxDecoration(
                          color: AppColors.shadeColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // image
                              Stack(
                                children: [
                                  Hero(
                                    tag: movies?[index].id??0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${movies?[index].posterPath}',
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // rating
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        Gap(3),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // text ans details
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movies?[index].title ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: getTitleStyle(),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            movies?[index].releaseDate ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: getbodyStyle(
                                                color: AppColors.redColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              // date
                            ]),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is GetMoviesFailed) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
