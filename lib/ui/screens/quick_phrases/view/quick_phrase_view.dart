import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';

import './components/body.dart';

class QuickPhraseView extends StatelessWidget {
  static String routeName = "/quick_phrase_view";
  
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: kPaddingBottom20),
        child: IconButton(icon: Icon(kIconComplete, color: Theme.of(context).buttonColor,), onPressed: () {}, iconSize: kSizeButtonComplete,),
      ),
    );
  }
}
