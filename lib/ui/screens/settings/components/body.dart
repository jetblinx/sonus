import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sonus/logic/cubit/languages_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/ui/screens/help/help.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

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
                    actions: [
                      PopupMenuButton(
                        icon: Icon(kIconMore),
                        color: Theme.of(context).colorScheme.background,
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              child: Text(
                                AppLocalizations.of(context).help,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              value: 'help',
                            ),
                          ];
                        },
                        onSelected: (value) => {
                          if (value == 'help')
                            Navigator.pushNamed(context, HelpScreen.routeName)
                        },
                      ),
                    ],
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
                                          .headline3),
                                  buildSwitch(
                                      settingsState.settings.speechRecognition,
                                      () {
                                    if (Converter.intToBool(settingsState
                                        .settings.speechRecognition)) {
                                      return settingsCubit.update(settingsState
                                          .settings
                                          .copyWith(SettingsModel(
                                              theme:
                                                  settingsState.settings.theme,
                                              speechRecognition:
                                                  Converter.boolToInt(!Converter
                                                      .intToBool(settingsState
                                                          .settings
                                                          .speechRecognition)),
                                              textToSpeech: 1)));
                                    }
                                    settingsCubit.update(settingsState.settings
                                        .copyWith(SettingsModel(
                                            speechRecognition: Converter
                                                .boolToInt(!Converter.intToBool(
                                                    settingsState.settings
                                                        .speechRecognition)))));
                                  }),
                                ]),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                          .text_to_speech,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                  buildSwitch(
                                      settingsState.settings.textToSpeech, () {
                                    if (Converter.intToBool(
                                        settingsState.settings.textToSpeech)) {
                                      return settingsCubit.update(settingsState
                                          .settings
                                          .copyWith(SettingsModel(
                                              theme:
                                                  settingsState.settings.theme,
                                              textToSpeech: Converter.boolToInt(
                                                  !Converter.intToBool(
                                                      settingsState.settings
                                                          .textToSpeech)),
                                              speechRecognition: 1,
                                              quickTts: 0)));
                                    }
                                    settingsCubit.update(settingsState.settings
                                        .copyWith(SettingsModel(
                                      textToSpeech: Converter.boolToInt(
                                          !Converter.intToBool(settingsState
                                              .settings.textToSpeech)),
                                    )));
                                  })
                                ]),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).quick_tts,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                  buildSwitch(settingsState.settings.quickTts,
                                      () {
                                    BlocProvider.of<SettingsCubit>(context)
                                        .update(settingsState.settings.copyWith(SettingsModel(
                                                quickTts: Converter.boolToInt(
                                                    !Converter.intToBool(settingsState.settings.quickTts)),
                                                theme: settingsState.settings.theme,
                                                speechRecognition: settingsState.settings.speechRecognition,
                                                textToSpeech: settingsState.settings.textToSpeech)));
                                  }),
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
                                      style: Theme.of(context).textTheme.headline3),
                                  buildSwitch(settingsState.settings.theme, () {
                                    settingsCubit.update(settingsState.settings.copyWith(SettingsModel(
                                                theme: Converter.boolToInt(!Converter.intToBool(settingsState.settings.theme)))));
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
                                          .headline3),
                                  BlocConsumer<LanguagesCubit, LanguagesState>(
                                    listener: (context, languagesState) {
                                      if (languagesState
                                          is LanguagesInitialState)
                                        BlocProvider.of<LanguagesCubit>(context)
                                            .load();
                                    },
                                    builder: (context, languagesState) {
                                      if (languagesState
                                          is LanguagesLoadedState) {
                                        final items = languagesState.languages
                                            .map(
                                              (language) => DropdownMenuItem(
                                                child: Text(language.name),
                                                value: language.id,
                                              ),
                                            )
                                            .toList();
                                        return DropdownButton(
                                          value:
                                              settingsState.settings.language,
                                          hint: Text(
                                              AppLocalizations.of(context)
                                                  .system_language,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .accentColor)),
                                          items: items,
                                          dropdownColor:
                                              Theme.of(context).backgroundColor,
                                          onChanged: (value) {
                                            final language = languagesState
                                                .languages
                                                .firstWhere(
                                                    (element) =>
                                                        element.id == value,
                                                    orElse: () => null);
                                            settingsCubit.update(settingsState
                                                .settings
                                                .copyWith(SettingsModel(
                                                    theme: settingsState
                                                        .settings.theme,
                                                    language: value,
                                                    languageCode:
                                                        language.languageCode,
                                                    localeCode:
                                                        language.ttsCode)));
                                          },
                                        );
                                      }
                                      return Container();
                                    },
                                  )
                                ])
                          ]))))
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

  InkWell buildSwitch(int value, Function onTap) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: kDurationSwitch,
        curve: Curves.decelerate,
        width: kSizeSwitchWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                Converter.intToBool(value) ? kColorPrimary : kColorSwitchGrey),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingSwitchCircle),
          child: AnimatedAlign(
            duration: kDurationSwitch,
            curve: Curves.decelerate,
            alignment: Converter.intToBool(value)
                ? Alignment.centerRight
                : Alignment.centerLeft,
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
//                                   style: Theme.of(context).textTheme.headline3),
//
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
//                                   style: Theme.of(context).textTheme.headline3),
//
//                             ]),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).quick_tts,
//                                   style: Theme.of(context).textTheme.headline3),
//
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
//                                   style: Theme.of(context).textTheme.headline3),
//
//                             ]),
//                         SizedBox(
//                           height: getProportionateScreenHeight(15),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(AppLocalizations.of(context).language,
//                                   style: Theme.of(context).textTheme.headline3),
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
