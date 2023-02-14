import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/my_colors.dart';

class ImagesViewer extends StatelessWidget {
  const ImagesViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.87,
            mainAxisSpacing: 15.h,
            crossAxisCount: 3,
            crossAxisSpacing: 15.h),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: MyColors.greeyTextFormField,
            borderRadius: BorderRadius.circular(30.sp),
            image: const DecorationImage(
              image: NetworkImage(
                'https://www.elbalad.news/Upload/libfiles/914/9/383.jpg',
              ),
              fit: BoxFit.cover, // to do add url of image
            ),
          ),
        ),
        itemCount: 40,
      ),
    );
  }
}
