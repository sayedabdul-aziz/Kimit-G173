import 'package:bookia_app/core/constants/assets/assets_images.dart';
import 'package:bookia_app/core/constants/governorates_list.dart';
import 'package:bookia_app/core/functions/email_validate.dart';
import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/core/widgets/custom_dialogs.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  int governorateId = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is PlaceOrderLoading) {
          showLoadingDialog(context);
        } else if (state is PlaceOrderSuccess) {
          Navigator.pop(context);
          showSuccessDialog();
        } else if (state is PlaceOrderError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.red,
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: const Text('Checkout'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<HomeCubit>().placeOrder(
                      name: usernameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      governorateId: governorateId.toString(),
                      address: addressController.text);
                }
              },
              text: 'Checkout',
              textStyle: getTitleStyle(color: AppColors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Total Price: ${widget.totalPrice} EGP',
                            style: getTitleStyle(),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    const Divider(),
                    const Gap(20),
                    Row(
                      children: [
                        Text(
                          'Customer Information',
                          style: getbodyStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!emailValidate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Address',
                      ),
                    ),
                    const Gap(15),
                    // DropdownButtonFormField(items: items, onChanged: onChanged),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor,
                      ),
                      child: DropdownButton(
                          dropdownColor: AppColors.secondaryColor,
                          isExpanded: true,
                          value: governorateId,
                          onChanged: (value) {
                            setState(() {
                              governorateId = value as int;
                            });
                          },
                          items: governoratesList
                              .map((city) => DropdownMenuItem(
                                  value: city['id'],
                                  child: Text(
                                      city["governorate_name_en"].toString())))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  showSuccessDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => SimpleDialog(
              alignment: Alignment.center,
              backgroundColor: AppColors.white,
              contentPadding: const EdgeInsets.all(20),
              children: [
                const Gap(20),
                Image.asset(
                  AssetsImages.done,
                  height: 150,
                  width: 150,
                ),
                const Gap(20),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Success', style: getTitleStyle(fontSize: 24)),
                      const Gap(20),
                      Text(
                        'Your order will be delivered soon.\nThank you for choosing our app!',
                        textAlign: TextAlign.center,
                        style: getbodyStyle(color: AppColors.primaryColor),
                      ),
                      const Gap(30),
                      CustomButton(
                        bgColor: AppColors.dark,
                        textStyle: getbodyStyle(color: AppColors.white),
                        text: 'Back To Home ',
                        onPressed: () {
                          navigateAndRemoveUntil(context, const NavBarWidget());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
  }
}
