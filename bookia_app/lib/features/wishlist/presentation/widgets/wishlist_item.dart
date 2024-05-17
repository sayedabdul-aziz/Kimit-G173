import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/wishlist/data/get_wish_list_response/datum.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/custom_btn.dart';

class WishlistItemWidget extends StatelessWidget {
  const WishlistItemWidget({
    super.key,
    required this.wishlistItem,
  });

  final WishlistItem wishlistItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            wishlistItem.image ?? '',
            height: 120,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(15),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      wishlistItem.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: getTitleStyle(),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_remove_outlined,
                          color: AppColors.red,
                        ))
                  ],
                ),
                Text(
                  wishlistItem.price ?? '',
                  style: getTitleStyle(),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    height: 40,
                    width: 120,
                    text: 'Add to cart',
                    textStyle: getbodyStyle(color: AppColors.white),
                    onPressed: () {}),
              ],
            )
          ],
        ))
      ],
    );
  }
}
