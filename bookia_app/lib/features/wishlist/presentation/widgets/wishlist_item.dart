import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/wishlist/data/get_wishlist_response/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocListener<HomeCubit, HomeStates>(
      listenWhen: (previous, current) => current is RemoveFromFavSuccess,
      listener: (context, state) {
        if (state is RemoveFromFavSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from wishlist'),
            ),
          );
          context.read<HomeCubit>().getWishlist();
        }
      },
      child: Row(
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
                        wishlistItem.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getTitleStyle(),
                      )),
                      //* ------------------ Remove from wishlist
                      IconButton(
                          onPressed: () {
                            context
                                .read<HomeCubit>()
                                .removeFromWishList(wishlistItem.id ?? 0);
                          },
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
      ),
    );
  }
}
