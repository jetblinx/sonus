import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'components/body.dart';

class Settings extends StatelessWidget {
  static String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SettingsCubit>(context),
      child: Scaffold(
        body: Body(),
      )
    );
  }
}
