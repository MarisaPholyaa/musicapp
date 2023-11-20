import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_app/utils/appcolors.dart';
import 'package:music_app/utils/font_style.dart';
import 'package:music_app/widgets/button.dart';

class DialogAlert {
  final BuildContext context;

  DialogAlert(this.context);

  open() {
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
          child: _DialogAlert(),
        );
      },
    );
  }
}

class _DialogAlert extends StatelessWidget {
  _DialogAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 450.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
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
            child: CircleAvatar(
              backgroundColor: AppColors.purple,
              radius: 50.r,
              child: CircleAvatar(
                backgroundColor: AppColors.lightpurple,
                radius: 40.r,
                child: Icon(
                  Icons.priority_high_outlined,
                  color: AppColors.darkpurple,
                  size: 40.sp,
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
                      onPressed: () {
                        Get.back();
                      },
                      text: "Close",
                      textStyle: FontWhite.font10,
                      backgroundColor: AppColors.red,
                      fixedSize: Size(40.w, 5.h),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
