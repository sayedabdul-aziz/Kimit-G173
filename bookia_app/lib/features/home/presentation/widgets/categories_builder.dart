import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/home/data/model/get_all_gategories_response/category.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/home/presentation/views/category_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CategoriesBuilder extends StatefulWidget {
  const CategoriesBuilder({
    super.key,
  });

  @override
  State<CategoriesBuilder> createState() => _CategoriesBuilderState();
}

class _CategoriesBuilderState extends State<CategoriesBuilder> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllCategories();
    super.initState();
  }

  List<Category>? categoriesList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Categories', style: getbodyStyle(fontSize: 24)),
          ],
        ),
        const Gap(15),
        BlocConsumer<HomeCubit, HomeStates>(
            buildWhen: (previous, state) =>
                state is GetAllCategoriesSuccess ||
                state is GetAllCategoriesLoading,
            listener: (context, state) {
              if (state is GetAllCategoriesError) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Something went wrong'),
                ));
              } else if (state is GetAllCategoriesSuccess) {
                categoriesList =
                    state.getAllGategoriesResponse.data?.categories;
              }
            },
            builder: (context, state) {
              if (state is GetAllCategoriesLoading) {
                return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                );
              }
              return categoriesList!.isNotEmpty
                  ? SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList?.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  navigateTo(
                                      context,
                                      CategoryDetailsView(
                                          categoryId:
                                              categoriesList?[index].id ?? 0,
                                          categoryName:
                                              categoriesList?[index].name ??
                                                  ''));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: const BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    categoriesList?[index].name ?? '',
                                    style: getbodyStyle(color: AppColors.dark),
                                  )),
                                ),
                              )))
                  : const SizedBox();
            }),
      ],
    );
  }
}
