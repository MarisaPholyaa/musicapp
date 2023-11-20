// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';

class TextFiledCustom extends StatelessWidget {
  String labelText;
  TextStyle? labelStyle;
  IconData? icon;
  bool? obscureText;
  int? maxLength;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  TextFiledCustom({
    Key? key,
    required this.labelText,
    this.labelStyle,
    this.icon,
    this.obscureText,
    this.maxLength,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.white,
      style: FontWhite.font16,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      maxLength: maxLength ?? 10,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        counterText: '',
        label: Row(
          children: [
            icon != null
                ? Icon(
                    icon,
                    size: 25.sp,
                    color: AppColors.white,
                  )
                : const SizedBox(),
            SizedBox(width: 5.w),
            Text(labelText),
          ],
        ),
        labelStyle: labelStyle ?? FontWhite.font16,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2.sp),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2.sp),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2.sp),
        ),
      ),
    );
  }
}
