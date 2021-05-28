import 'package:flutter/material.dart';

import 'components/body.dart';

class Note extends StatelessWidget {
  static String routeName = "/note";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}