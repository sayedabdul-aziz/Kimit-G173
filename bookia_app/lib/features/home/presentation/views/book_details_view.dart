import 'package:bookia_app/core/constants/assets/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/features/home/data/model/get_products_response/product.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is AddToFavSuccess || state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added Successfully'),
            ),
          );
        } else if (state is AddToFavError || state is AddToCartError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Something went wrong'),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          leading: const CustomBackButton(),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<HomeCubit>().addToFav(book.id ?? 0);
                },
                icon: SvgPicture.asset(AssetsIcons.wishlist)),
            const Gap(10),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            Expanded(
              child: Text(
                book.price ?? '',
                textAlign: TextAlign.center,
                style: getTitleStyle(fontSize: 24),
              ),
            ),
            const Gap(20),
            CustomButton(
                height: 50,
                width: MediaQuery.of(context).size.width * .6,
                bgColor: AppColors.dark,
                text: 'Add To Cart',
                textStyle: getTitleStyle(
                  color: AppColors.white,
                ),
                onPressed: () {
                  context.read<HomeCubit>().addToCart(book.id ?? 0);
                })
          ]),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Hero(
                    tag: book.name ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        book.image ?? '',
                        width: 200,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    book.name ?? '',
                    style: getTitleStyle(
                      fontSize: 21,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    book.category ?? '',
                    style: getbodyStyle(
                        fontSize: 18, color: AppColors.primaryColor),
                  ),
                  const Gap(20),
                  Text(
                    book.description ?? '',
                    textAlign: TextAlign.justify,
                    style: getbodyStyle(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
