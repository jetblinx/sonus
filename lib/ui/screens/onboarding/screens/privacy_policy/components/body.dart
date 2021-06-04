import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/widgets/buttons/onboarding_button.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Container(),
                        height: getProportionateScreenHeight(10),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPaddingScreenPage),
                        child: AppBar(
                          iconTheme: IconThemeData(
                            color: Theme.of(context).accentColor,
                          ),
                          centerTitle: true,
                          title: Text(
                            AppLocalizations.of(context).privacy_policy,
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
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                  child: Column(
                    children: [
                      Divider(),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Text(
                              AppLocalizations.of(context)
                                  .privacy_policy_content,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      OnboardingButton(
                        label: AppLocalizations.of(context).accept,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Major.routeName);
                          BlocProvider.of<SettingsCubit>(context).update(
                              settingsState.settings.copyWith(SettingsModel(
                                  onboardingShown: Converter.boolToInt(true))));
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
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
