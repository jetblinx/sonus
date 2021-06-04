import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/onboarding/onboadring.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/size_config.dart';

class LauncherScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<SettingsCubit, SettingsState>(
        builder: (BuildContext context, state) { 
          if (state is SettingsLoadedState) {
            if (Converter.intToBool(state.settings.onboardingShown)) {
              return Container(
                child: Major(),
              );
            }
            return Container(
              child: OnboardingScreen(),
            );
          }
          return Container();
         },
    );
  }
}