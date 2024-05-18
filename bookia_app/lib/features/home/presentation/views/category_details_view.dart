import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView(
      {super.key, required this.categoryId, required this.categoryName});
  final int categoryId;
  final String categoryName;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  void initState() {
    context.read<HomeCubit>().getBooksByCategory(widget.categoryId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(widget.categoryName.toString()),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetBooksError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is GetCategoryDetailsSuccess) {
            var books = state.getAllGategoriesResponse.data?.products;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 300),
                  itemCount: books?.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        navigateTo(
                            context, BookDetailsView(book: books![index]));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // image
                            Hero(
                              tag: books?[index].name ?? '',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  books?[index].image ?? '',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Gap(5),
                            Text(books?[index].name ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: getbodyStyle(fontSize: 18)),
                            const Gap(15),
                            Row(children: [
                              Text(
                                books?[index].price ?? '',
                                style: getTitleStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.dark,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'Add To Cart',
                                  style: getbodyStyle(
                                      color: AppColors.white, fontSize: 12),
                                ),
                              ),
                              // Expanded(
                              //   child: CustomButton(
                              //       height: 35,
                              //       bgColor: AppColors.dark,
                              //       text: 'Add To Cart',
                              //       textStyle: getsmallStyle(
                              //           color: AppColors.white, fontSize: 10),
                              //       onPressed: () {}),
                              // )
                            ])
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
