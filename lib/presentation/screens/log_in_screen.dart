import 'package:flutter/material.dart';
import '../../core/constant.dart';
import '../../core/widgets/background_image_widget.dart';
import '../widgets/log_in_widgets/camera_icon_photo_widget.dart';
import '../widgets/log_in_widgets/logIn_container_widget.dart';
import '../widgets/log_in_widgets/underContainer_icons_my_gallery-text_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundImageWidget(image: logInBg),
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CameraPhotoWidget(),
                      const UnderContainerIconsAndMygalleryText(),
                      LogInContainerWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
