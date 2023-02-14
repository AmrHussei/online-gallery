import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant.dart';
import '../../../core/my_colors.dart';

class UnderContainerIconsAndMygalleryText extends StatelessWidget {
  const UnderContainerIconsAndMygalleryText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 206.h),
        const MyGalleryTextWidget(),
        SizedBox(height: 30.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 28.w),
          height: 450.h,
          width: 390.w,
          child: Image.asset(
            underContainerIcons,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class MyGalleryTextWidget extends StatelessWidget {
  const MyGalleryTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 122.h,
          width: 174.w,
          child: Text(
            'My Gallery',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.blackMainText,
            ),
          ),
        ),
      ],
    );
  }
}
