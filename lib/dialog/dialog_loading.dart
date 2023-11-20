import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:music_app/utils/appcolors.dart';

class DialogShowLoading {
  showLoaderDialog(BuildContext context) {
    Center alert = Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: AppColors.white,
        size: 70.sp,
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
