import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:music_app/screen/login/signup_screen.dart';
import 'package:music_app/screen/playlists/playlist_screen.dart';
import 'package:music_app/screen/splash_screen.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';
import 'package:music_app/widgets/boxDecoration.dart';
import 'package:music_app/widgets/button.dart';
import 'package:music_app/widgets/img_custom.dart';
import 'package:music_app/widgets/textfiled.dart';

import '../../dialog/dialog_loading.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(
          () => const SplashScreen(),
          transition: Transition.fadeIn,
        );
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            decoration: customBoxPurpleDecoration(),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                LogoCustom(height: 90.h),
                SizedBox(height: 10.h),
                Text("My Account", style: FontWhite.font40Bold),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: TextFiledCustom(
                    labelText: 'Phone number or e-mail *',
                    icon: Icons.person,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: TextFiledCustom(
                    labelText: 'Password *',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20.h),
                ButtonCustom(
                  text: 'Login',
                  onPressed: () {
                    // DialogShowLoading().showLoaderDialog(Get.context!);
                    // Get.to(
                    //   () => PlaylistScreen(),
                    //   transition: Transition.fadeIn,
                    // );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.white,
                        thickness: 2.sp,
                        height: 10.h,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                    Text("or", style: FontWhite.font18Bold),
                    Expanded(
                      child: Divider(
                        color: AppColors.white,
                        thickness: 2.sp,
                        height: 10.h,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ortherlogin(),
                SizedBox(height: 10.h),
                TextButtonCustom(
                  text: 'Forgot Password ?',
                  onPressed: () {},
                ),
                TextButtonCustom(
                  text: "DON'T HAVE ACCOUNT ? SIGN UP",
                  textStyle: FontPurple.font16,
                  onPressed: () {
                    Get.to(
                      () => SignUPScreen(),
                      transition: Transition.fadeIn,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ortherlogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            log("gggg");
          },
          child: ImgCustom(
            assetName: 'assets/svg/google.svg',
            height: 40.h,
          ),
        ),
        SizedBox(width: 30.w),
        InkWell(
          onTap: () {
            log("fb");
          },
          child: ImgCustom(
            assetName: 'assets/svg/facebook.svg',
            height: 40.h,
          ),
        ),
      ],
    );
  }
}
