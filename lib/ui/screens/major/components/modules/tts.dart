import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TTS extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _textController = TextEditingController();

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
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        if (settingsState is SettingsLoadedState) {
          if (Converter.intToBool(settingsState.settings.textToSpeech) &&
              Converter.intToBool(settingsState.settings.speechRecognition)) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: 0, maxHeight: kSizeBlockChips),
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
                    isBorder: true,
                  ),
                ],
              ),
            );
          }
          if (Converter.intToBool(settingsState.settings.textToSpeech) &&
              !Converter.intToBool(settingsState.settings.speechRecognition)) {
            return Expanded(
              //color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kPaddingAllHorizontal),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.28,
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
                  // TextInputField(
                  //   isBorder: true,
                  // ),
                  Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        border: Border(
                            top: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).dividerColor)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPaddingAllHorizontal),
                        child: Form(
                          child: TextFormField(
                            controller: _textController,
                            style: Theme.of(context).textTheme.headline3,
                            textCapitalization: TextCapitalization.sentences,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle:
                                    Theme.of(context).textTheme.headline3,
                                hintText:
                                    AppLocalizations.of(context).enter_text,
                                //icon: icon == null ? null : Icon(kIconDismiss),
                                // suffixIcon: icon != null
                                //     ? IconButton(
                                //         //icon: icon,
                                //         onPressed: () {},
                                //       )
                                //     : null
                                    ),
                            minLines: 1,
                            maxLines: kSizeTextFieldLines,
                          ),
                        ),
                      ),
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
