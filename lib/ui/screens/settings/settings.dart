import 'package:flutter/material.dart';

import 'components/body.dart';

class Settings extends StatelessWidget {
  static String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}