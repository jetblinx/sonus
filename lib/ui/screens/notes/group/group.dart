import 'package:flutter/material.dart';

import 'components/body.dart';

class GroupView extends StatelessWidget {
  static String routeName = "/group_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}