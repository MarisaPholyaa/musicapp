import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/component/boxDecoration.dart';
import 'package:music_app/component/button.dart';
import 'package:music_app/component/img_custom.dart';
import 'package:music_app/screen/login/login_screen.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: customBoxPurpleDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            LogoCustom(height: 200.h),
            Text("MUSIC", style: FontWhite.font60Bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Listen to relaxing music while working, create yor favourite playlists!",
                style: FontWhite.font20,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.h),
            ButtonCustom(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            ButtonCustomOutline(
              text: 'Sign Up',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
