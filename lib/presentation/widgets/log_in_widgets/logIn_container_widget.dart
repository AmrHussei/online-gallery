import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_photo_gallary/business_logic/log_in_cubit/log_in_cubit.dart';
import 'package:online_photo_gallary/core/widgets/text_utils.dart';
import 'package:online_photo_gallary/presentation/screens/home_screen.dart';
import 'package:online_photo_gallary/presentation/widgets/log_in_widgets/auth_text_form_field.dart';
import 'package:online_photo_gallary/presentation/widgets/log_in_widgets/submited_button.dart';

class LogInContainerWidget extends StatelessWidget {
  LogInContainerWidget({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 370.h,
      right: 28.h,
      left: 28.h,
      bottom: 45.h,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            height: 400.h,
            width: 388.w,
            decoration: BoxDecoration(
                color: Colors.white54.withOpacity(0.4),
                borderRadius: BorderRadius.circular(33.sp)),
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextUtils(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        text: 'LOG IN',
                        underLine: TextDecoration.none),
                    AuthTextFormFiled(
                        controller: emailController,
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {},
                        hintText: 'Email'),
                    AuthTextFormFiled(
                        controller: passwordController,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        validator: (value) {},
                        hintText: 'Password'),
                    SubmitedButton(
                      onPressed: () {
                        BlocProvider.of<LogInCubit>(context).logInUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                    _buildPhoneNumberSubmitedBloc(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<LogInCubit, LogInState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is TryLogIn) {
          showProgressIndicator(context);
        }

        if (state is SuccessLogIn) {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }

        if (state is FailureLogIn) {
          Navigator.pop(context);
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

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
