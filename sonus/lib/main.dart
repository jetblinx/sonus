import 'package:flutter/material.dart';
import 'package:sonus/utils/routes.dart';

import 'ui/screens/major/major.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sonus',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: Major.routeName,
      routes: routes,
    );
  }
}
