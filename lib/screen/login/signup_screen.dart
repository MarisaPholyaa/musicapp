import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as GetX;
import 'package:music_app/dialog/dialog_loading.dart';
import 'package:music_app/models/usermodel.dart';
import 'package:music_app/screen/login/bloc/signup_bloc.dart';
import 'package:music_app/screen/login/login_screen.dart';
import 'package:music_app/screen/splash_screen.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';
import 'package:music_app/widgets/boxDecoration.dart';
import 'package:music_app/widgets/button.dart';
import 'package:music_app/widgets/img_custom.dart';
import 'package:music_app/widgets/textfiled.dart';

class SignUPScreen extends StatelessWidget {
  SignUPScreen({super.key});

  var user = UserModel();

  SignupBloc signBloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        GetX.Get.to(
          () => const SplashScreen(),
          transition: GetX.Transition.fadeIn,
        );
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: BlocBuilder<SignupBloc, SignupState>(
            bloc: signBloc,
            builder: (context, state) {
              if (state is SignupFail) {
                return dialogAlertError();
              } else {
                return Container(
                  width: double.infinity,
                  decoration: customBoxPurpleDecoration(),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      LogoCustom(height: 70.h),
                      SizedBox(height: 10.h),
                      Text("My Account", style: FontWhite.font30Bold),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        child: TextFiledCustom(
                          labelText: 'Phone number *',
                          onChanged: (value) {
                            user.phoneNo = value;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h, right: 10.w),
                              child: TextFiledCustom(
                                labelText: 'Name *',
                                onChanged: (value) {
                                  user.name = value;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h, left: 10.w),
                              child: TextFiledCustom(
                                labelText: 'Last Name *',
                                onChanged: (value) {
                                  user.lastName = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        child: TextFiledCustom(
                          labelText: 'Email *',
                          maxLength: 20,
                          validator: (value) {
                            if (value != null) {
                              signBloc.add(ValidateSignUp(email: value));
                              return '';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            signBloc.add(SetText(value));
                            user.email = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        child: TextFiledCustom(
                          labelText: 'Password *',
                          icon: Icons.lock,
                          obscureText: true,
                          onChanged: (value) {
                            user.password = value;
                          },
                        ),
                      ),
                      SizedBox(height: 5.h),
                      ButtonCustom(
                        text: 'Sign UP',
                        onPressed: () async {
                          DialogShowLoading().showLoaderDialog(GetX.Get.context!);
                          await Future.delayed(const Duration(seconds: 1));
                          signBloc.add(SignUpDataEvent(user: user));
                        },
                      ),
                      SizedBox(height: 5.h),
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
                        text: "Already have an account ? Log in",
                        textStyle: FontPurple.font16,
                        onPressed: () {
                          GetX.Get.to(
                            () => const LoginScreen(),
                            transition: GetX.Transition.fadeIn,
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  AlertDialog dialogAlertError() {
    return AlertDialog(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          bottomLeft: Radius.circular(50.r),
          topRight: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 130.h,
        width: 450.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            bottomLeft: Radius.circular(50.r),
            topRight: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.priority_high_outlined,
                    color: AppColors.white,
                    size: 80.sp,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alert !", style: FontBlack.font18Bold),
                    Text("Please fill in complete Information.", style: FontBlack.font14, maxLines: 2),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ButtonCustom(
                        onPressed: () {},
                        text: "Close",
                        textStyle: FontWhite.font10,
                        // backgroundColor: Appc,
                        fixedSize: Size(20.w, 5.h),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
