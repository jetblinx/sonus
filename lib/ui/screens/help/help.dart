import 'package:flutter/material.dart';
import 'components/body.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = "/help";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}