import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
import 'package:insights_news_4_20/features/manager/news_cubit.dart';
import 'package:insights_news_4_20/features/manager/news_state.dart';

class SearchNewsListBuilder extends StatefulWidget {
  const SearchNewsListBuilder({super.key});

  @override
  State<SearchNewsListBuilder> createState() => _SearchNewsListBuilderState();
}

class _SearchNewsListBuilderState extends State<SearchNewsListBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is GetNewsBySearchSuccessState) {
          var news = state.newsModel.articles;
          return ListView.builder(
              itemCount: news?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          news?[index].urlToImage ?? '',
                          width: 150,
                          height: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 150,
                              height: 90,
                              child: Icon(
                                Icons.error,
                                color: AppColors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news?[index].title ?? '',
                              style: getBodyStyle(fontsize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(5),
                            Text(
                              news?[index].author ?? '',
                              style: getSmallStyle(fontsize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.menu,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                                const Gap(5),
                                Text(
                                  'Read',
                                  style: getBodyStyle(fontsize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        } else if (state is GetNewsBySearchErrorState) {
          return Center(
            child: Text(
              state.error,
              style: getSmallStyle(color: AppColors.white),
            ),
          );
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.search_off,
                color: AppColors.grey,
                size: 80,
              ),
              const Gap(20),
              Text('No News Found',
                  style: getSmallStyle(color: AppColors.white)),
            ],
          ));
        }
      },
    );
  }
}
