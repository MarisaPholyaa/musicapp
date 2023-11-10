// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';

class ButtonCustom extends StatelessWidget {
  void Function() onPressed;
  TextStyle? textStyle;
  Color? backgroundColor;
  Size? fixedSize;
  double? radius;
  String text;
  ButtonCustom({
    Key? key,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.fixedSize,
    this.radius,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.purple2,
        fixedSize: fixedSize ?? Size(260.w, 70.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 40.0),
        ),
      ),
      child: Text(
        text,
        style: textStyle ?? FontWhite.font20,
      ),
    );
  }
}

class ButtonCustomOutline extends StatelessWidget {
  void Function() onPressed;
  TextStyle? textStyle;
  Color? backgroundColor;
  Size? fixedSize;
  double? radius;
  String text;
  ButtonCustomOutline({
    Key? key,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.fixedSize,
    this.radius,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: fixedSize ?? Size(260.w, 70.h),
        side: BorderSide(color: backgroundColor ?? AppColors.purple2, width: 5.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 40.0),
        ),
      ),
      child: Text(
        text,
        style: textStyle ?? FontPurple.font20,
      ),
    );
  }
}
