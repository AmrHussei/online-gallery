import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'dart:io';
import 'package:online_photo_gallary/business_logic/home_cubit/home_cubit.dart';
import 'package:online_photo_gallary/business_logic/upload_cubit/upload_cubit.dart';
import 'package:online_photo_gallary/presentation/widgets/home_screen_widget/build_alert_buttons.dart';

import '../../../core/constant.dart';
import '../../../core/my_colors.dart';

showUploadDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 50,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33.sp),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 7),
            child: Container(
              width: 500.w,
              height: 310.h,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(33.sp)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: ButtonOfAlert(
                      onTap: () async {
                        File? imageFile =
                            await BlocProvider.of<UploadCubit>(context)
                                .getImageFromGallery();
                        String token = ApiConstant.token;
                        if (imageFile != null) {
                          String response =
                              // ignore: use_build_context_synchronously
                              await BlocProvider.of<UploadCubit>(context)
                                  .uploadImageToApi(imageFile, token);

                          print(response);
                        }
                      },
                      icon: gallery,
                      color: MyColors.pink,
                      text: 'Gallery',
                    ),
                  ),
                  ButtonOfAlert(
                    onTap: () async {
                      File? imageFile =
                          await BlocProvider.of<UploadCubit>(context)
                              .getImageFromCamera();
                      String token = ApiConstant.token;
                      if (imageFile != null) {
                        String response =
                            // ignore: use_build_context_synchronously
                            await BlocProvider.of<UploadCubit>(context)
                                .uploadImageToApi(imageFile, token);

                        print(response);
                      }
                    },
                    icon: cameraButtonIcon,
                    color: Colors.white,
                    text: 'Camera',
                  ),
                  _buildPhoneNumberSubmitedBloc()
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildPhoneNumberSubmitedBloc() {
  return BlocListener<UploadCubit, UploadState>(
    listenWhen: (previous, current) {
      return previous != current;
    },
    listener: (context, state) {
      if (state is SuccesUploadFromGallery) {
        Navigator.pop(context);
        BlocProvider.of<HomeCubit>(context).getImages();
        String errorMsg = 'Photo Uploaded to server';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ),
        );
      }

      if (state is ErrorUploadFromGallery) {
        String errorMsg = 'something has wrong try again';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    },
    child: Container(),
  );
}
