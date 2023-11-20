import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as GetX;
import 'package:music_app/dialog/dialog_alert.dart';
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

class SignUPScreen extends StatefulWidget {
  SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  var user = UserModel();

  SignupBloc signBloc = SignupBloc();

  @override
  void initState() {
    blocListenner();
    super.initState();
  }

  blocListenner() {
    if (mounted) {
      signBloc.stream.listen((event) {
        if (event is SignupFail) {
          DialogAlert(GetX.Get.context!).open();
        }
      });
    }
  }

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
                          signBloc.add(SetText(text: value, type: "phone"));
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
                                signBloc.add(SetText(text: value, type: "name"));
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
                                signBloc.add(SetText(text: value, type: "lastname"));
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
                        maxLength: 30,
                        onChanged: (value) {
                          signBloc.add(SetText(text: value, type: "email"));
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
                          signBloc.add(SetText(text: value, type: "password"));
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
            },
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
