import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant.dart';

class CameraPhotoWidget extends StatelessWidget {
  const CameraPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60.h,
      left: 75.w,
      child: SizedBox(
        height: 131.h,
        width: 131.h,
        child: Image.asset(
          camera,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
