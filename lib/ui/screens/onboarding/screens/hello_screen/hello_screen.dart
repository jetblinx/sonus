import 'package:flutter/material.dart';
import 'components/body.dart';

class HelloScreen extends StatelessWidget {
  static String routeName = '/hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}