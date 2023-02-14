import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/text_utils.dart';

class BuilderOfLogOutAndUploadButton extends StatelessWidget {
  const BuilderOfLogOutAndUploadButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });
  final Function() onTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 145.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.sp), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.h,
              width: 30.h,
              child: Image.asset(
                icon,
                fit: BoxFit.fill,
              ),
            ),
            TextUtils(
              fontSize: 21.sp,
              fontWeight: FontWeight.normal,
              text: text,
              underLine: TextDecoration.none,
            )
          ],
        ),
      ),
    );
  }
}
