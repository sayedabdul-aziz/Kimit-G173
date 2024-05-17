import 'package:bookia_app/core/constants/assets/assets_icons.dart';
import 'package:bookia_app/core/constants/assets/assets_images.dart';
import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/home/data/model/get_book_response/book.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookia_app/features/home/presentation/widgets/home_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Book>? books = [];
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getBooks();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          AssetsImages.logo,
          height: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.notification),
          ),
          const Gap(5),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.search),
          ),
          const Gap(10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            // slider
            const HomeSliderWidget(),
            // books

            const Gap(20),
            Row(
              children: [
                Text('Explore Books', style: getbodyStyle(fontSize: 24)),
              ],
            ),
            const Gap(15),
            BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {
                if (state is GetBooksSuccess) {
                  books = state.getBookResponse.data;
                } else if (state is GetBooksError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetBooksLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return books!.isEmpty
                    ? const Center(
                        child: Text('No Data Found'),
                      )
                    : GridView.builder(
                        // to make all screen scrolling and never scroll gridView only
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        //--
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 12,
                                mainAxisExtent: 300),
                        itemCount: books?.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              navigateTo(context,
                                  BookDetailsView(book: books![index]));
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
                                    tag: books?[index].title ?? '',
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
                                  Text(books?[index].title ?? '',
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        'Add To Cart',
                                        style: getbodyStyle(
                                            color: AppColors.white,
                                            fontSize: 12),
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
                        },
                      );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
