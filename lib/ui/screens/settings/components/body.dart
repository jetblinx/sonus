import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/logger.dart';
import 'package:sonus/utils/size_config.dart';

class Body  extends StatefulWidget {
  Body ({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool speechRecognition = false;
  bool speechToText = false;
  bool theme = true;
  int language = 1;

  @override
  Widget build(BuildContext context) {
    final SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsInitialState) settingsCubit.load();
        if (state is SettingsErrorState) settingsCubit.load();
      },
      builder: (context, state) {
        if (state is SettingsCurrentState) {
          return Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                color: Theme.of(context).backgroundColor,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context).speech_recognition,
                                    style: Theme.of(context).textTheme.headline2),
                                // FlatSwitch(asrOn: asrOn),
                                Switch(value: state.settings.speechRecognition == 0 ? false : true, onChanged: (bool value) {
                                  // setState(() {
                                  //   speechRecognition = value;
                                  // });
                                  // state.copyWith(SettingsModel(speechRecognition: value ? 1 : 0));
                                })
                              ]),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context).speech_to_text,
                                    style: Theme.of(context).textTheme.headline2),
                                // FlatSwitch(asrOn: asrOn),
                                Switch(value: state.settings.textToSpeech == 0 ? false : true, onChanged: (bool value) {
                                  if (value) {
                                    settingsCubit.update(SettingsModel(textToSpeech: 1));
                                  } else {
                                    settingsCubit.update(SettingsModel(textToSpeech: 0));
                                  }
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context).dark_theme,
                                    style: Theme.of(context).textTheme.headline2),
                                // FlatSwitch(asrOn: asrOn),
                                // FIXME aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                                Switch(
                                  value: Converter.intToBool( state.settings.theme),
                                  onChanged: (bool isDark) {
                                    Logger.log(state.settings.theme.toString());
                                  settingsCubit.update(SettingsModel(theme: Converter.boolToInt(isDark)));
                                  }
                                )
                              ]),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context).language,
                                    style: Theme.of(context).textTheme.headline2),
                                Text(AppLocalizations.of(context).language_choosen,
                                    style: Theme.of(context).textTheme.headline1)
                              ]
                          )
                        ])
                  )
                )
              )
            ])
          );
        }
        return Scaffold(
          body: Center(child: Text("Error of settings loading"),),
        );    
      }
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
