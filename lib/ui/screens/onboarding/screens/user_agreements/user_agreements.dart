import 'package:flutter/material.dart';

import 'components/body.dart';

class UserAgreementsScreen extends StatelessWidget {
  static String routeName = "/user_agreements";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}