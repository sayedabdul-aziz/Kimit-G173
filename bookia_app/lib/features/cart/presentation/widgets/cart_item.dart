import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/cart/data/get_cart_response/datum.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.model,
    required this.onPressed,
  });

  final CartModel model;
  final void Function()? onPressed;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(10),
        //   child: Image.network(
        //     widget.model.image ?? '',
        //     height: 120,
        //     width: 100,
        //     fit: BoxFit.cover,
        //   ),
        // ),
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
                    // Expanded(
                    //     child: Text(
                    //   widget.model.title ?? '',
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 1,
                    //   style: getTitleStyle(),
                    // )),
                    IconButton(
                        onPressed: widget.onPressed,
                        icon: const Icon(
                          Icons.bookmark_remove_outlined,
                          color: AppColors.red,
                        ))
                  ],
                ),
                Text(
                  widget.model.price.toString(),
                  style: getTitleStyle(),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.small(
                  elevation: 0,
                  backgroundColor: AppColors.secondaryColor,
                  onPressed: () {
                    if (qty > 1) {
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                const Gap(10),
                Text(
                  qty.toString(),
                  style: getTitleStyle(),
                ),
                const Gap(10),
                FloatingActionButton.small(
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                  backgroundColor: AppColors.secondaryColor,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
