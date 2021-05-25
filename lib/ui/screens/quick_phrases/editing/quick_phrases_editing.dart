import 'package:flutter/material.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';

import './components/body.dart';

class QuickPhrasesEditing extends StatelessWidget {
  static String routeName = "/quick_phrases_editing";
  
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
        child: TextInputField(controller: _controller, icon: Icon(kIconAdd),),
      ),
    );
  }
}
