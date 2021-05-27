import 'package:flutter/material.dart';

import 'components/body.dart';

class Notes extends StatelessWidget {
  static String routeName = "/archive";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}