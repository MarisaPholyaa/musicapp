import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/component/boxDecoration.dart';
import 'package:music_app/component/button.dart';
import 'package:music_app/component/img_custom.dart';
import 'package:music_app/component/textfiled.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  labelText: 'Phone number or e-mail*',
                  icon: Icons.person,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: TextFiledCustom(
                  labelText: 'Password*',
                  icon: Icons.lock,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20.h),
              ButtonCustom(
                text: 'Login',
                onPressed: () {},
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
              Text("Forgot Password?", style: FontWhite.font18),
            ],
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
