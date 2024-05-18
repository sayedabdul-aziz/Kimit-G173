import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getCart();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        buildWhen: (previous, current) =>
            current is GetCartSuccess || current is GetCartLoading,
        builder: (context, state) {
          if (state is GetCartSuccess) {
            var cartData = state.getCartResponse.data;
            return cartData?.cartItems == null || cartData!.cartItems!.isEmpty
                ? const Center(
                    child: Text('No Books in cart'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: cartData.cartItems!.length,
                            itemBuilder: (context, index) {
                              return CartItemWidget(
                                model: cartData.cartItems![index],
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              height: 30,
                            ),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Text(
                              'Total: ${cartData.total}',
                              style: getTitleStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
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
