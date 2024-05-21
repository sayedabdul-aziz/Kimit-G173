import 'dart:io';

import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/core/widgets/custom_dialogs.dart';
import 'package:bookia_app/features/profile/data/get_profile_response/data.dart';
import 'package:bookia_app/features/profile/presentation/manager/profile_cubit.dart';
import 'package:bookia_app/features/profile/presentation/manager/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class EditprofileView extends StatefulWidget {
  const EditprofileView({super.key, required this.model});

  final ProfileModel model;

  @override
  State<EditprofileView> createState() => _EditprofileViewState();
}

class _EditprofileViewState extends State<EditprofileView> {
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  @override
  void initState() {
    usernameController = TextEditingController(text: widget.model.name);
    phoneController = TextEditingController(text: widget.model.phone);
    addressController = TextEditingController(text: widget.model.address);
    super.initState();
  }

  String path = '';

  uploadImage() async {
    var pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is UpdateProfileLoading) {
          showLoadingDialog(context);
        } else if (state is UpdateProfileSuccess) {
          context.read<ProfileCubit>().getProfile();
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is UpdateProfileError) {
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
                  if (path.isNotEmpty) {
                    context.read<ProfileCubit>().updateProfile(
                          name: usernameController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                          path: path,
                        );
                  } else {
                    context.read<ProfileCubit>().updateProfile(
                          name: usernameController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                        );
                  }
                }
              },
              text: 'Save Changes',
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
                    // update image using circle avater
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: path.isNotEmpty
                              ? FileImage(File(path)) as ImageProvider
                              : NetworkImage(
                                  widget.model.image ?? '',
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.white,
                            child: IconButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                icon: const Icon(Icons.camera_alt)),
                          ),
                        ),
                      ],
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
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
