import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_text_styles.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/auth/data/models/movie_model.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // image
        Stack(
          children: [
            Hero(
              tag: movie.id ?? 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  height: MediaQuery.sizeOf(context).height * .5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // rating
            Positioned(
              top: 40,
              left: 30,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.arrow_back_ios_outlined)),
              ),
            ),
          ],
        ),
        // text ans details
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getTitleStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movie.releaseDate ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getbodyStyle(color: AppColors.redColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
        // date
      ]),
    );
  }
}
