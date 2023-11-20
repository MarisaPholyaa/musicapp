import 'package:flutter/material.dart';
import 'package:music_app/utils/appcolors.dart';

BoxDecoration customBoxPurpleDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.purple2, AppColors.purple, AppColors.lightpurple],
    ),
  );
}
