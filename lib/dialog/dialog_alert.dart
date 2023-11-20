import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';

class DialogAlert {
  final BuildContext context;

  DialogAlert(this.context);

  open({
    String msg = '',
    VoidCallback? onPressed,
    String? submsg,
    String img = '',
    double? scale,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: _DialogAlert(
            msg: msg,
            onPressed: onPressed,
            submsg: submsg,
            img: img,
            scale: scale,
          ),
        );
      },
    );
  }
}

class _DialogAlert extends StatelessWidget {
  final String msg;
  VoidCallback? onPressed;
  String? submsg;
  String img;
  double? scale;

  _DialogAlert({
    Key? key,
    required this.msg,
    this.onPressed,
    this.submsg,
    required this.img,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //...top circlular image part,
        content(),
        // image icons
        icons(),
      ],
    );
  }

  Widget icons() {
    return Positioned(
      left: 50.w,
      right: 50.w,
      top: 10.h,
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 60.r,
        child: Center(
          child: SvgPicture.asset(
            img,
            height: scale,
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.only(
        top: 80.h,
        bottom: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      margin: EdgeInsets.only(top: 50.h),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              msg,
              style: FontBlack.font18Bold,
              textAlign: TextAlign.center,
            ),
          ),
          submsg == null || submsg == "" ? const SizedBox() : Text(submsg!, style: FontBlack.font16),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.center,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
