import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/phrases_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TTS extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  final String language = "ru-RU";
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        if (settingsState is SettingsLoadedState) {
          return BlocConsumer<PhrasesCubit, PhrasesState>(
            listener: (context, phrasesState) {
              if (phrasesState is PhrasesLoadedState) BlocProvider.of<PhrasesCubit>(context).load();
            },
            builder: (context, phrasesState) {
              if (phrasesState is PhrasesLoadedState) {
                if (Converter.intToBool(settingsState.settings.textToSpeech) && Converter.intToBool(settingsState.settings.speechRecognition)) {
                  final List<dynamic> phrases = phrasesState.phrases;
                  // phrases.add(Icon(kIconAdd));
                  return Container(
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                      children: [
                        Divider(
                          height: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                          child: phrasesState.phrases.isNotEmpty 
                          ? Container(
                            constraints: BoxConstraints(minHeight: 0, maxHeight: kSizeBlockChips),
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
                                      phrases: phrases,
                                      onPress: "sound",
                                      flutterTts: flutterTts,
                                      language: language,
                                    ),
                                    SizedBox(
                                      height: kPaddingBlockChips,
                                    ),
                                  ],
                              ) 
                            ),
                          ) 
                          : Container(),
                        ),
                        TextInputField(
                          isBorder: true,
                        ),
                      ],
                    ),
                  );
                }
                if (Converter.intToBool(settingsState.settings.textToSpeech) && !Converter.intToBool(settingsState.settings.speechRecognition)) {
                  final List<dynamic> phrases = phrasesState.phrases;
                  return Expanded(
                    //color: Theme.of(context).backgroundColor,
                    child: Column(
                      children: [
                        Expanded(
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
                                    phrases: phrases,
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
              }
              return Container();
            }
          );
        }
        return Container();
      },
    );
  }
}
