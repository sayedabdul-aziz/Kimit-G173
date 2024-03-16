import 'package:chat_app_ui/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixOnPressed,
    this.obscureText,
  });

  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Function()? suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: AppColors.secondry,
        filled: true,

        label: Text(label),
        // hintText: 'Enter Your Email',
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.primary,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                color: AppColors.primary,
                onPressed: suffixOnPressed,
                icon: Icon(suffixIcon))
            : const SizedBox(),

        // borders
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
