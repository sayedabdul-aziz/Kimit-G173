import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_3_19/core/functions/custom_dialogs.dart';
import 'package:taskati_3_19/core/functions/routing.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/core/widgets/custom_btn.dart';
import 'package:taskati_3_19/features/home/home_view.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  // cache your date and navigate
                  AppLocalStorage.cacheData('name', name);
                  AppLocalStorage.cacheData('image', path);
                  navigateWithReplacment(context, const HomeView());
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Please Enter Your Name');
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please Upload Your Image');
                } else {
                  showErrorDialog(
                      context, 'Please Upload Your Image and Enter Your Name');
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IMAGE
              CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.primary,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage('assets/user.png'),
              ),
              const Gap(30),
              CustomButton(
                text: 'Upload From Camera',
                onPressed: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },
              ),
              const Gap(10),
              CustomButton(
                text: 'Upload From Gallery',
                onPressed: () {
                  // pick image
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    // check is picked or no
                    if (value != null) {
                      setState(() {
                        // pass its path to path
                        path = value.path;
                      });
                    }
                  });
                },
              ),
              Divider(
                height: 40,
                color: AppColors.primary,
              ),

              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: getSmallStyle(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primary)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primary)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
