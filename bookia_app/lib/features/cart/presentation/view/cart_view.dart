import 'package:bookia_app/features/cart/data/get_cart_response/datum.dart';
import 'package:bookia_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartModel>? data = [];

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getCart();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetCartSuccess) {
            data = state.getCartResponse.data;
          }
        },
        builder: (context, state) {
          if (state is GetBooksLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = data;
          return list == null || list.isEmpty
              ? const Center(
                  child: Text('No Books in cart'),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return BlocListener<HomeCubit, HomeStates>(
                        listener: (context, state) {
                          if (state is RemoveFromCartSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Removed from cart Successfully'),
                              ),
                            );
                            data = state.getCartResponse.data;
                          }
                        },
                        child: CartItemWidget(
                          onPressed: () {
                            context
                                .read<HomeCubit>()
                                .removeFromCart(list[index].cartId ?? 0);
                          },
                          model: list[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 30,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
