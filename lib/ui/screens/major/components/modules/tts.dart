import 'package:flutter/material.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';

class TTS extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  final List chips = [
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    //"Go home",
    Icon(
      kIconAdd,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 0,
                maxHeight: kSizeBlockChips
            ),
            child: Scrollbar(
              radius: Radius.circular(20),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: kPaddingBlockChips,),
                  ChipBuilder(chips: chips, onPress: "sound",),
                  SizedBox(height: kPaddingBlockChips,),
                ],
              ),
            ),
          ),
          TextInputField(controller: _controller, isBorder: true,),
        ],
      ),
    );
  }
}
