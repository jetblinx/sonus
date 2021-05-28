import 'package:flutter/material.dart';

import 'components/body.dart';

class Groups extends StatelessWidget {
  static String routeName = "/groups";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}