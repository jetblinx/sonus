import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sonus/utils/constants.dart';

class Body extends StatelessWidget {

  final String assetName = 'assets/logo/logo_transparent.svg';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: kColorBackgroundScreenSplash,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return Container(
      child: Center(child: SvgPicture.asset(assetName, height: 100,)),
    );
  }
}