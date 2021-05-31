import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/languages_cubit.dart';
import 'package:sonus/logic/cubit/phrases_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/cubit/tts_fied_cubit.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/icons.dart';


class TTS extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  // final _formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

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
              return BlocProvider(
                create: (context) => TtsFiedCubit(),
                child: BlocBuilder<TtsFiedCubit, String>(
                  builder: (context, ttsFiedValue) {
                    return BlocBuilder<LanguagesCubit, LanguagesState>(
                      builder: (context, languagesState) {
                        if (languagesState is LanguagesLoadedState) {
                          if (phrasesState is PhrasesLoadedState) {
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
                                                  phrases: phrasesState.phrases,
                                                  onPress: "sound",
                                                  flutterTts: flutterTts,
                                                  language: languagesState.languages.firstWhere((element) => element.languageCode == Localizations.localeOf(context).languageCode).ttsCode,
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
                                    buildTTSField(context, ttsFiedValue, languagesState, settingsState)
                                  ],
                                ),
                              );
                            }
                            if (Converter.intToBool(settingsState.settings.textToSpeech) && !Converter.intToBool(settingsState.settings.speechRecognition)) {
                              if (phrasesState.phrases.isNotEmpty) {
                                return Expanded(
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
                                                  phrases: phrasesState.phrases,
                                                  onPress: "sound",
                                                  flutterTts: flutterTts,
                                                  language: languagesState.languages.firstWhere((element) => element.languageCode == Localizations.localeOf(context).languageCode).ttsCode,
                                                ),
                                                SizedBox(
                                                  height: kPaddingBlockChips,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      buildTTSField(context, ttsFiedValue, languagesState, settingsState)
                                    ],
                                  ),
                                );
                              } else {
                                return Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                                          child: Center(
                                            child: Text(AppLocalizations.of(context).no_phrases)
                                          )
                                        )
                                      ),
                                      buildTTSField(context, ttsFiedValue, languagesState, settingsState)
                                    ],
                                  ),
                                );
                              }
                            }
                          }
                        }
                        return Container();
                      },
                    );
                  }
                )
              );
            }
          );
        }
        return Container();
      },
    );
  }

  TextInputField buildTTSField(BuildContext context, String ttsFiedValue, LanguagesLoadedState languagesState, SettingsLoadedState settingsLoadedState) {
    List words;
    return TextInputField(
      onChanged: (String value) async {
        BlocProvider.of<TtsFiedCubit>(context).update(value);
        if (Converter.intToBool(settingsLoadedState.settings.quickTts)) {
          words = value.split(' ');
          String lastValue = value.substring(value.length - 1);
          if (words.length >= 2 && lastValue == " ") {
            await flutterTts.setLanguage(languagesState.languages.firstWhere((element) => element.languageCode == Localizations.localeOf(context).languageCode).ttsCode);
            await flutterTts.setPitch(1.0);
            await flutterTts.setSpeechRate(0.9);
            await flutterTts.speak(words[words.length-2]);
          }
        }
      },
      controller: _controller,
      autoClear: true,
      isBorder: true,
      suffixIcon: _controller.text.isEmpty ? null : Icon(kIconSend),
      icon: _controller.text.isEmpty ? null : Icon(kIconDismiss),
      onDismiss: () {
        BlocProvider.of<TtsFiedCubit>(context).clear();                    
      },
      onPressed: () async {
        HapticFeedback.lightImpact();
        await flutterTts.setLanguage(languagesState.languages.firstWhere((element) => element.languageCode == Localizations.localeOf(context).languageCode).ttsCode);
        await flutterTts.setPitch(1.0);
        await flutterTts.setSpeechRate(0.9);
        await flutterTts.speak(ttsFiedValue);
        print(ttsFiedValue);
        BlocProvider.of<TtsFiedCubit>(context).clear();                    
      },
    );
  }
}