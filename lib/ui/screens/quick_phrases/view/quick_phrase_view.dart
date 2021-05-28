import 'package:flutter/material.dart';

import './components/body.dart';

class QuickPhraseView extends StatelessWidget {
  static String routeName = "/quick_phrase_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
