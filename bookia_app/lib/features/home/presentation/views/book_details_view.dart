import 'package:bookia_app/core/constants/assets/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/features/home/data/model/get_book_response/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomBackButton(),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AssetsIcons.wishlist)),
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
              onPressed: () {})
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Hero(
                  tag: book.title ?? '',
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
                  book.title ?? '',
                  style: getTitleStyle(
                    fontSize: 21,
                  ),
                ),
                const Gap(10),
                Text(
                  book.category ?? '',
                  style:
                      getbodyStyle(fontSize: 18, color: AppColors.primaryColor),
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
    );
  }
}
