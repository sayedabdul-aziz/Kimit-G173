import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/core/widgets/custom_btn.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    bool isDark = AppLocalStorage.getCachedData('isDark') ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // get theme from local storage
              // change theme
              setState(() {
                isDark = !isDark;
              });
              AppLocalStorage.cacheData('isDark', isDark);
            },
            icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          )
        ],
      ),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: Hive.box('user').listenable(),
        builder: (context, box, child) {
          var name = box.get('name');
          var image = box.get('image');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                // alignment: Alignment.bottomRight,
                children: [
                  // image
                  ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.file(
                        File(image),
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // showErrorDialog(context, 'Error');
                          return Image.asset(
                            'assets/user.png',
                            width: 50,
                          );
                        },
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        updateProfileImage(context);
                      },
                      child: CircleAvatar(
                        radius: 18,
                        foregroundColor: AppColors.primary,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Divider(
                indent: 30,
                endIndent: 30,
                color: AppColors.primary,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Text(
                      name,
                      style: getTitleStyle(context, color: AppColors.primary),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        updateProfileName(context, name);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary)),
                        child: Icon(
                          Icons.edit,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }

  Future<dynamic> updateProfileImage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  height: 50,
                  width: double.infinity,
                  text: 'Upload From Camera',
                  onPressed: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then((value) {
                      if (value != null) {
                        AppLocalStorage.cacheData('image', value.path);
                      }
                    });
                    Navigator.pop(context);
                  }),
              const Gap(15),
              CustomButton(
                  height: 50,
                  width: double.infinity,
                  text: 'Upload From Camera',
                  onPressed: () {})
            ],
          ),
        );
      },
    );
  }

  updateProfileName(context, name) {
    var formkey = GlobalKey<FormState>();
    var textCon = TextEditingController(text: name);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Your Name mustn\'t be empty';
                      }
                      return null;
                    },
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      width: double.infinity,
                      text: 'Update Name',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          AppLocalStorage.cacheData('name', textCon.text);
                          Navigator.of(context).pop();
                        }
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
