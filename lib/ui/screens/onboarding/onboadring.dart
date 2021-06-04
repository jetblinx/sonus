import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';
import 'screens/hello_screen/hello_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = '/onboarding'; 

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: HelloScreen(),
    );
  }
}