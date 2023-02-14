import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        SizedBox(
          height: 85.h,
          width: 145.w,
          child: const TextUtils(
              fontSize: 31,
              fontWeight: FontWeight.normal,
              text:
                  'Welcom Mina', // todo get user name and showw it in ui ****************
              underLine: TextDecoration.none),
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
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://media.licdn.com/dms/image/C4D03AQG_gRF7HFQ4ww/profile-displayphoto-shrink_800_800/0/1662793286706?e=1681948800&v=beta&t=mFQ9xmSJDx0sn24E0w5CN2KnF2gaxZbTGPQWcGUpQsc'))),
            ),
          ),
        )
      ],
    );
  }
}
