import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/widgets/buttons/onboarding_button.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/link_launcher.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsInitialState) settingsCubit.load();
        if (state is SettingsErrorState) settingsCubit.load();
      },
      builder: (context, settingsState) {
        if (settingsState is SettingsLoadedState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         child: Container(),
                //         height: getProportionateScreenHeight(10),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: kPaddingScreenPage),
                //         child: AppBar(
                //           iconTheme: IconThemeData(
                //             color: Theme.of(context).accentColor,
                //           ),
                //           centerTitle: true,
                //           title: Text(
                //             AppLocalizations.of(context).privacy_policy,
                //             style: Theme.of(context).textTheme.caption,
                //           ),
                //           backgroundColor: Colors.transparent,
                //           elevation: 0.0,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                  child: Column(
                    children: [
                      // Divider(),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(15),
                      // ),
                      Spacer(flex: 6,),
                      Container(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context).sonus,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  AppLocalizations.of(context).privacy_policy,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 4,),
                      //Divider(),
                      RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14.0),
                          children: [
                            new TextSpan(
                              text: "By proceeding you agree with\n",
                            ),
                            new TextSpan(
                              text: "Terms of Service",
                              style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14.0, color: kColorLink, decoration: TextDecoration.underline,),
                              recognizer: new TapGestureRecognizer()..onTap = () {
                                LinkLauncher.launchURL("https://commanderxa.github.io/sonus/about/terms_of_service/terms_of_service.html");
                              }
                            ),
                            new TextSpan(
                              text: " and ",
                            ),
                            new TextSpan(
                              text: "Privacy Policy",
                              style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14.0, color: kColorLink, decoration: TextDecoration.underline,),
                              recognizer: new TapGestureRecognizer()..onTap = () {
                                LinkLauncher.launchURL("https://commanderxa.github.io/sonus/about/privacy_policy/privacy_policy.html");
                              }
                            ),
                          ]
                        ),
                      ),
                      SizedBox(height: 10),
                      OnboardingButton(
                        label: "Get Started",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Major.routeName);
                          BlocProvider.of<SettingsCubit>(context).update(
                              settingsState.settings.copyWith(SettingsModel(
                                  onboardingShown: Converter.boolToInt(true))));
                        },
                      ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(25),
                      // ),
                      Spacer(),
                    ],
                  ),
                )),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
