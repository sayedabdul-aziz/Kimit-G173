import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
import 'package:insights_news_4_20/features/manager/news_cubit.dart';
import 'package:insights_news_4_20/features/views/widgets/search_news_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search For News',
          style: getTitleStyle(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // search
            TextFormField(
              style: getBodyStyle(),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search For News',
              ),
              onChanged: (value) {
                context.read<NewsCubit>().getNewsBySearch(value);
              },
            ),
            const Gap(20),
            // news
            const Expanded(child: SearchNewsListBuilder())
          ],
        ),
      ),
    );
  }
}
