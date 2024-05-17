import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/local_services.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:bookia_app/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getWishlist();
    log(AppLocalStorage.getCachedData(ktoken));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Books'),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is GetWishlistSuccess) {
            var list = state.getWishListResponse.data;
            return list == null || list.isEmpty
                ? const Center(
                    child: Text('No Favourite Books'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return WishlistItemWidget(
                          wishlistItem: list[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        height: 30,
                      ),
                    ),
                  );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
