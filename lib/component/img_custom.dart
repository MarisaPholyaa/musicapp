// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoCustom extends StatelessWidget {
  double height;
  LogoCustom({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/logo.svg', height: height);
  }
}

class ImgCustom extends StatelessWidget {
  double height;
  String assetName;
  ImgCustom({
    Key? key,
    required this.height,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName, height: height);
  }
}
