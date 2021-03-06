import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';

import 'components/body.dart';

class Major extends StatelessWidget {
  static String routeName = "/major";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}