import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/my_colors.dart';

class AuthTextFormFiled extends StatelessWidget {
  const AuthTextFormFiled({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Function validator;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      validator: (value) => validator(value),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: MyColors.greeyTextFormField,
        contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.sp),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.sp),
          borderSide: const BorderSide(color: MyColors.orangeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.sp),
          borderSide: BorderSide(color: MyColors.blue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.sp),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
