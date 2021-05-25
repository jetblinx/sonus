import 'package:flutter/material.dart';

import './components/body.dart';

class QuickPhrasesEditing extends StatelessWidget {
  static String routeName = "/quick_phrases_editing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}