import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_photo_gallary/core/constant.dart';
import 'package:online_photo_gallary/core/my_colors.dart';

import '../../../core/widgets/text_utils.dart';

class NameAndImageOfUser extends StatelessWidget {
  const NameAndImageOfUser({
    super.key,
    required this.onPressedOnUserImage,
  });
  final Function() onPressedOnUserImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUtils(
                    fontSize: 31,
                    fontWeight: FontWeight.normal,
                    text:
                        'Welcom', // todo get user name and showw it in ui ****************
                    underLine: TextDecoration.none),
                Text(
                  UserDataConstant.nameOfUser.substring(0, 12),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 31,
                    color: MyColors.blackMainText,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 15.w, 30.h),
          child: InkWell(
            onTap:
                onPressedOnUserImage, //to do allow user to dowenloade her photo **********************

            child: Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.sp),
                  image: const DecorationImage(image: AssetImage(profile))),
            ),
          ),
        )
      ],
    );
  }
}
