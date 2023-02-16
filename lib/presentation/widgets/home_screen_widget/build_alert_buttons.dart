import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/text_utils.dart';

class ButtonOfAlert extends StatelessWidget {
  const ButtonOfAlert({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.color,
  });
  final Function() onTap;
  final String text;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 184.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.sp),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40.h,
                width: 40.h,
                child: Image.asset(
                  icon,
                  fit: BoxFit.fill,
                ),
              ),
              TextUtils(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                text: text,
                underLine: TextDecoration.none,
              )
            ],
          ),
        ),
      ),
    );
  }
}
