import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
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
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        if (settingsState is SettingsLoadedState) {
          if (Converter.intToBool(settingsState.settings.textToSpeech) && Converter.intToBool(settingsState.settings.speechRecognition)) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Divider(
                    height: 1,
                  ),
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
          if (Converter.intToBool(settingsState.settings.textToSpeech) && !Converter.intToBool(settingsState.settings.speechRecognition)) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                      child:  Container(
                        height: MediaQuery.of(context).size.height/1.28,
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
                  Container(
                    height: 80,
                    child: TextInputField(
                      controller: _controller,
                      isBorder: true,
                    ),
                  ),
                ],
              ),
            );
          }

        }
        return Container();
      },
    );
    
  }
}
