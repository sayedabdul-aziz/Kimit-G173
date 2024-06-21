import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety_5_28/core/utils/colors.dart';

showErrorDialog(context, errorText) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.redColor,
      behavior: SnackBarBehavior.floating,
      // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      content: Text(errorText)));
}

// loading
showLoadingDialog(BuildContext context) {
  //------------ Using Custom Loading for IOS & Android

  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/loading.json', width: 150, height: 150),
        ],
      );
    },
  );
}



 //------------ Using CupertinoAlertDialog for IOS

  // showDialog(
  //   barrierDismissible: false,
  //   barrierColor: Colors.black.withOpacity(.7),
  //   context: context,
  //   builder: (BuildContext context) {
  //     return CupertinoAlertDialog(
  //       content: Row(
  //         children: [
  //           CircularProgressIndicator(
  //             color: AppColors.color1,
  //           ),
  //           Container(
  //               margin: const EdgeInsets.only(right: 15),
  //               child: const Text("جاري التحميل ...")),
  //         ],
  //       ),
  //     );
  //   },
  // );

  //------------ Using AlertDialog for Android

  // showDialog(
  //   barrierDismissible: false,
  //   barrierColor: Colors.black.withOpacity(.7),
  //   context: context,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       content: Row(
  //         children: [
  //           CircularProgressIndicator(
  //             color: AppColors.color1,
  //           ),
  //           Container(
  //               margin: const EdgeInsets.only(right: 15),
  //               child: const Text("جاري التحميل ...")),
  //         ],
  //       ),
  //     );
  //   },
  // );