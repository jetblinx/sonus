import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';
import 'components/body.dart';

class Splash extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackgroundScreenSplash,
      body: Body(),
    );
  }
}