import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.bgColor,
    this.fgColor,
    this.height,
    this.width,
    this.radius,
    required this.onPressed,
    this.isBorder = false,
  });
  final String text;
  final bool? isBorder;
  final Color? bgColor;
  final Color? fgColor;
  final double? height;
  final double? width;
  final double? radius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: isBorder == true
                ? const BorderSide()
                : const BorderSide(width: 0, color: Colors.transparent),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: bgColor ?? AppColors.primaryColor,
            foregroundColor: fgColor ?? AppColors.white,
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
