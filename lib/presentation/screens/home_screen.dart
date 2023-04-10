import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_photo_gallary/business_logic/log_in_cubit/log_in_cubit.dart';
import 'package:online_photo_gallary/core/constant.dart';
import 'package:online_photo_gallary/core/my_colors.dart';
import 'package:online_photo_gallary/core/widgets/background_image_widget.dart';
import 'package:online_photo_gallary/presentation/screens/log_in_screen.dart';
import '../widgets/home_screen_widget/builderOf_logOutAnd_upload_button.dart';
import '../widgets/home_screen_widget/images_viewer.dart';
import '../widgets/home_screen_widget/name_and_imageOf_user.dart';
import '../widgets/home_screen_widget/show_upload_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.curvedColor,
        body: Stack(
          children: [
            const BackgroundImageWidget(image: homeScreenBG),
            Padding(
              padding: EdgeInsets.fromLTRB(20.h, 20.h, 20.h, 0),
              child: Column(
                children: [
                  NameAndImageOfUser(
                    onPressedOnUserImage:
                        () {}, //to do allow user to dowenloade her photo **********************
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 22.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuilderOfLogOutAndUploadButton(
                          onTap: () async {
                            await BlocProvider.of<LogInCubit>(context).logOut();
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()),
                            );
                          },
                          text: 'Log out',
                          icon: logOutIcon,
                        ),
                        BuilderOfLogOutAndUploadButton(
                          onTap: () {
                            showUploadDialog(context);
                            // todo Up Lad image **************
                          },
                          text: 'Upload',
                          icon: uploadIcon,
                        ),
                      ],
                    ),
                  ),
                  const ImagesViewer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
