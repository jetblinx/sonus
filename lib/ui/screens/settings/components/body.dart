import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sonus/logic/cubit/languages_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/size_config.dart';

import '../../../../main.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override 
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    final SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
      if (state is SettingsInitialState) settingsCubit.load();
      if (state is SettingsErrorState) settingsCubit.load();
    }, builder: (context, settingsState) {
      if (settingsState is SettingsLoadedState) {
        return Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            //color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
                  child: AppBar(
                    iconTheme: IconThemeData(
                      color: Theme.of(context).accentColor,
                    ),
                    centerTitle: true,
                    title: Text(
                      AppLocalizations.of(context).settings,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              kPaddingScreenPage + kPaddingScreenPageContent),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text(AppLocalizations.of(context).modules,
                                style: Theme.of(context).textTheme.headline1),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                          .speech_recognition,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                    
                                  //   onTap: () {
                                  //     if (!value) {
                                  //         return settingsCubit.update(
                                  //             settingsState.settings.copyWith(
                                  //                 SettingsModel(
                                  //                   theme: settingsState.settings.theme,
                                  //                     speechRecognition:
                                  //                         Converter.boolToInt(
                                  //                             value),
                                  //                     textToSpeech: 1)));
                                  //       }
                                  //       settingsCubit.update(settingsState
                                  //           .settings
                                  //           .copyWith(SettingsModel(
                                  //               speechRecognition:
                                  //                   Converter.boolToInt(
                                  //                       value))));
                                  //   },
                                  //   child: AnimatedContainer(
                                  //     duration: kDurationSwitch,
                                  //     curve: Curves.decelerate,
                                  //     width: kSizeSwitchWidth,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(50),
                                  //         color: value ? kColorPrimary : kColorSwitchGrey),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(kPaddingSwitchCircle),
                                  //       child: AnimatedAlign(
                                  //         duration: kDurationSwitch,
                                  //         curve: Curves.decelerate,
                                  //         alignment: asrOn ? Alignment.centerRight : Alignment.centerLeft,
                                  //         child: Container(
                                  //           width: kSizeSwitchCircle,
                                  //           height: kSizeSwitchCircle,
                                  //           decoration: BoxDecoration(
                                  //               color: kColorWhite, borderRadius: BorderRadius.circular(100)),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  Switch(
                                      value: Converter.intToBool(settingsState
                                          .settings.speechRecognition),
                                      onChanged: (bool value) {
                                        if (!value) {
                                          return settingsCubit.update(
                                            settingsState.settings.copyWith(
                                              SettingsModel(
                                                theme: settingsState.settings.theme,
                                                  speechRecognition:
                                                      Converter.boolToInt(
                                                        value
                                                      ),
                                                textToSpeech: 1
                                              )
                                            )
                                          );
                                        }
                                        settingsCubit.update(settingsState
                                            .settings
                                            .copyWith(SettingsModel(
                                                speechRecognition:
                                                    Converter.boolToInt(
                                                        value))));
                                      })
                                ]),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                          .speech_to_text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  // FlatSwitch(asrOn: asrOn),
                                  Switch(
                                      value: Converter.intToBool(settingsState.settings.textToSpeech),
                                      onChanged: (bool value) {
                                        if (!value) {
                                          return settingsCubit.update(
                                              settingsState.settings.copyWith(
                                                  SettingsModel(
                                                    theme: settingsState.settings.theme,
                                                      textToSpeech:
                                                          Converter.boolToInt(
                                                              value),
                                                      speechRecognition: 1, quickTts: 0)
                                              )
                                          );
                                        }
                                        settingsCubit.update(settingsState.settings.copyWith(SettingsModel(
                                          textToSpeech: Converter.boolToInt(value))));
                                      })
                                ]),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).quick_tts,
                                    style: Theme.of(context).textTheme.headline2
                                  ),
                                  // FlatSwitch(asrOn: asrOn),
                                  Switch(
                                      value: Converter.intToBool(settingsState.settings.quickTts),
                                      onChanged: (bool value) {
                                        BlocProvider.of<SettingsCubit>(context).update(settingsState.settings.copyWith(SettingsModel(
                                          quickTts: Converter.boolToInt(value),
                                          theme: settingsState.settings.theme, 
                                          speechRecognition: settingsState.settings.speechRecognition,
                                          textToSpeech: settingsState.settings.textToSpeech
                                        )));
                                      })
                                ]),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(AppLocalizations.of(context).settings_general,
                                style: Theme.of(context).textTheme.headline1),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),

                            // Theme
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).dark_theme,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  // FlatSwitch(asrOn: asrOn),
                                  Switch(
                                      value: Converter.intToBool(
                                          settingsState.settings.theme),
                                      onChanged: (bool isDark) {
                                        settingsCubit.update(settingsState
                                            .settings
                                            .copyWith(SettingsModel(
                                                theme: Converter.boolToInt(
                                                    isDark))));
                                      })
                                ]),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),

                            // Language
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).language,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  // Text(AppLocalizations.of(context).language_choosen,
                                  //     style: Theme.of(context).textTheme.headline1)
                                  BlocConsumer<LanguagesCubit, LanguagesState>(
                                    listener: (context, languagesState) {
                                      if (languagesState is LanguagesInitialState) BlocProvider.of<LanguagesCubit>(context).load();
                                    },
                                    builder: (context, languagesState) {
                                      if (languagesState is LanguagesLoadedState) {
                                        final items = languagesState.languages.map((language) => 
                                            DropdownMenuItem(
                                              child: Text(language.name),
                                              value: language.id,
                                            ),
                                        ).toList();
                                        return DropdownButton(
                                          value: settingsState.settings.language,
                                          hint: Text(AppLocalizations.of(context).system_language, style: TextStyle(color: Theme.of(context).accentColor)),
                                          items: items,
                                          dropdownColor: Theme.of(context).backgroundColor,
                                          onChanged: (value) {
                                              final language = languagesState.languages.firstWhere((element) => element.id == value, orElse: () => null);
                                              settingsCubit.update(settingsState.settings.copyWith(SettingsModel(theme: settingsState.settings.theme, language: value, languageCode: language.languageCode, localeCode: language.ttsCode)));
                                              //RestartWidget.restartApp(context);
                                          },
                                        );
                                      }
                                      return Container();
                                    },
                                  )
                                ])
                          ])
                  )
              )
          )
        ]));
      }
      return Scaffold(
          body: Center(
              child: SvgPicture.asset(
        "assets/logo/logo_transparent.svg",
        height: 150.0,
        width: 150.0,
      )));
    });
  }
}

// class Body extends StatelessWidget {
//   final bool asrOn = true;

//   @override
//   Widget build(BuildContext context) {

//     String accentColorGroupName = "Accent color";

//     return BlocBuilder<SettingsCubit, SettingsState>(
//       builder: (context, state) {
//       if (state is SettingsLoadedState) {
//         return Container(
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(
//               color: Theme.of(context).backgroundColor,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: getProportionateScreenHeight(10),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
//                     child: AppBar(
//                       iconTheme: IconThemeData(
//                         color: Theme.of(context).accentColor,
//                       ),
//                       centerTitle: true,
//                       title: Text(
//                         AppLocalizations.of(context).settings,
//                         style: Theme.of(context).textTheme.caption,
//                       ),
//                       backgroundColor: Colors.transparent,
//                       elevation: 0.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: getProportionateScreenHeight(20),
//                         ),
//                         Text(AppLocalizations.of(context).modules,
//                             style: Theme.of(context).textTheme.headline1),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).speech_recognition,
//                                   style: Theme.of(context).textTheme.headline2),
//                               // FlatSwitch(asrOn: asrOn),
//                               Switch(value: state.settings.speechRecognition, onChanged: (bool value) {
//                                 state.copyWith(SettingsModel(speechRecognition: value));
//                               })
//                             ]),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).speech_to_text,
//                                   style: Theme.of(context).textTheme.headline2),
//                               // FlatSwitch(asrOn: asrOn),
//                             ]),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).quick_tts,
//                                   style: Theme.of(context).textTheme.headline2),
//                               // FlatSwitch(asrOn: asrOn),
//                             ]),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Divider(
//                           height: 1,
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Text(AppLocalizations.of(context).settings_general,
//                             style: Theme.of(context).textTheme.headline1),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).dark_theme,
//                                   style: Theme.of(context).textTheme.headline2),
//                               // FlatSwitch(asrOn: asrOn),
//                             ]),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).language,
//                                   style: Theme.of(context).textTheme.headline2),
//                               Text(AppLocalizations.of(context).language_choosen,
//                                   style: Theme.of(context).textTheme.headline1)
//                             ]
//                         )
//                       ])
//                 )
//               )
//             )
//           ])
//         );
//       }
//       }
//     );

//   }
// }

class FlatSwitch extends StatelessWidget {
  const FlatSwitch({
    Key key,
    @required this.asrOn,
  }) : super(key: key);

  final bool asrOn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: AnimatedContainer(
        duration: kDurationSwitch,
        curve: Curves.decelerate,
        width: kSizeSwitchWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: asrOn ? kColorPrimary : kColorSwitchGrey),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingSwitchCircle),
          child: AnimatedAlign(
            duration: kDurationSwitch,
            curve: Curves.decelerate,
            alignment: asrOn ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: kSizeSwitchCircle,
              height: kSizeSwitchCircle,
              decoration: BoxDecoration(
                  color: kColorWhite, borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ),
      ),
    );
  }
}
