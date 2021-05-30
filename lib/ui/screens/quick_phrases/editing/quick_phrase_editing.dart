import 'package:flutter/material.dart';
import 'package:sonus/logic/models/phrase_model.dart';

import './components/body.dart';

class QuickPhraseEditing extends StatelessWidget {
  static String routeName = "/quick_phrase_editing";
  final PhraseModel phrase;
  QuickPhraseEditing({this.phrase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(phrase: this.phrase),
    );
  }
}
