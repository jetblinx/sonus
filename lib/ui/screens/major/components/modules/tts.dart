import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';

class TTS extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  final List chips = [
    "Привет",
    "Как дела?",
    "Что нового?",
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

  final String language = "ru-RU";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
            child: Container(
              constraints:
                  BoxConstraints(minHeight: 0, maxHeight: kSizeBlockChips),
              child: Scrollbar(
                radius: Radius.circular(20),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: kPaddingBlockChips,
                    ),
                    ChipBuilder(
                      chips: chips,
                      onPress: "sound",
                      flutterTts: flutterTts,
                      language: language,
                    ),
                    SizedBox(
                      height: kPaddingBlockChips,
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextInputField(
            controller: _controller,
            isBorder: true,
          ),
        ],
      ),
    );
  }
}
