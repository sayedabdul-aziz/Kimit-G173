import 'dart:developer';

import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/cart/data/get_cart_response/cart_item.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.model,
  });

  final CartItem model;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int qty = 0;

  @override
  void initState() {
    qty = widget.model.itemQuantity ?? 0;
    log('${widget.model.itemId} ---$qty');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listenWhen: (previous, current) =>
          current is RemoveFromCartSuccess || current is UpdateCartSuccess,
      listener: (context, state) {
        if (state is RemoveFromCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from cart'),
            ),
          );
          context.read<HomeCubit>().getCart();
        } else if (state is UpdateCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Updated cart'),
            ),
          );
          context.read<HomeCubit>().getCart();
        }
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.model.itemProductImage ?? '',
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
                        widget.model.itemProductName ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getTitleStyle(),
                      )),
                      //* Remove From Cart
                      IconButton(
                          onPressed: () {
                            context
                                .read<HomeCubit>()
                                .removeFromCart(widget.model.itemId ?? 0);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.red,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.model.itemProductPrice.toString(),
                        style: getTitleStyle(color: AppColors.grey).copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.dark,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        '${widget.model.itemProductPriceAfterDiscount} EGP',
                        style: getTitleStyle(),
                      ),
                      const Spacer(),
                      Text(
                        '-${widget.model.itemProductDiscount}%',
                        style: getTitleStyle(color: AppColors.red),
                      ),
                    ],
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
                        context
                            .read<HomeCubit>()
                            .updateCart(widget.model.itemId ?? 0, --qty);
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
                      if (qty < widget.model.itemProductStock!.toInt()) {
                        context
                            .read<HomeCubit>()
                            .updateCart(widget.model.itemId ?? 0, ++qty);
                        log(qty.toString());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.red,
                            content: Text('No more items in stock'),
                          ),
                        );
                      }
                    },
                    backgroundColor: AppColors.secondaryColor,
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
