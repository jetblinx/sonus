import 'package:flutter/material.dart';

import './components/body.dart';

class QuickPhrasesView extends StatelessWidget {
  static String routeName = "/quick_phrases_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
