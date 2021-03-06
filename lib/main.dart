import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonus/logic/cubit/languages_cubit.dart';
import 'package:sonus/logic/cubit/phrases_cubit.dart';
import 'package:sonus/logic/cubit/records_cubit.dart';
import 'package:sonus/logic/cubit/records_groups_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/repositories/themes_repository.dart';
import 'package:sonus/ui/screens/launcher/launcher.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/remove_scroll_glow.dart';
import 'package:sonus/utils/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingsCubit()),
          BlocProvider(create: (context) => PhrasesCubit()),
          BlocProvider(create: (context) => LanguagesCubit()),
          BlocProvider(create: (context) => RecordsGroupsCubit()),
          BlocProvider(create: (context) => RecordsCubit()),
        ],
        child: BlocConsumer<SettingsCubit, SettingsState>(
                    listener: (context, state) {
                  if (state is SettingsErrorState)
                    BlocProvider.of<SettingsCubit>(context).load();
                }, builder: (context, state) {
                  if (state is SettingsLoadedState) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Sonus',

                      // Removes Scroll Glow Everywhere
                      builder: (context, child) {
                        return ScrollConfiguration(
                          behavior: RemoveScrollGlow(),
                          child: child,
                        );
                      },

                      themeMode: state.settings.theme == 0 ||
                              state.settings.theme == null
                          ? ThemeMode.light
                          : ThemeMode.dark,
                      theme: ThemesRepisotory.light,
                      darkTheme: ThemesRepisotory.dark,
                      supportedLocales: L10n.all,
                      localizationsDelegates: [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      locale: state.settings.languageCode != null
                          ? Locale(state.settings.languageCode)
                          : null,
                      home: new AnnotatedRegion<SystemUiOverlayStyle>(
                          value: SystemUiOverlayStyle(
                            statusBarColor: Colors.transparent,
                            statusBarIconBrightness:
                                state.settings.theme == 0 ||
                                        state.settings.theme == null
                                    ? Brightness.dark
                                    : Brightness.light,
                            systemNavigationBarColor:
                                state.settings.theme == 0 ||
                                        state.settings.theme == null
                                    ? kColorLightScaffoldBackground
                                    : kColorDarkScaffoldBackground,
                            systemNavigationBarIconBrightness:
                                state.settings.theme == 0 ||
                                        state.settings.theme == null
                                    ? Brightness.dark
                                    : Brightness.light,
                            systemNavigationBarDividerColor: Colors.transparent,
                          ),
                          child: LauncherScreen()),
                      routes: routes,
                    );
                  }
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Sonus',

                      // Removes Scroll Glow Everywhere
                      builder: (context, child) {
                        return ScrollConfiguration(
                          behavior: RemoveScrollGlow(),
                          child: child,
                        );
                      },
                      themeMode: ThemeMode.dark,
                      theme: ThemesRepisotory.light,
                      darkTheme: ThemesRepisotory.dark,
                      supportedLocales: L10n.all,
                      localizationsDelegates: [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      home: new AnnotatedRegion<SystemUiOverlayStyle>(
                          value: SystemUiOverlayStyle(
                            statusBarColor: Colors.transparent,
                            statusBarIconBrightness: Brightness.light,
                            systemNavigationBarColor:
                                kColorDarkScaffoldBackground,
                            systemNavigationBarIconBrightness: Brightness.light,
                            systemNavigationBarDividerColor: Colors.transparent,
                          ),
                          child: Scaffold(
                              body: Center(
                                  child: SvgPicture.asset(
                            "assets/logo/logo_transparent.svg",
                            height: 75.0,
                          )))));
                })
              );
  }
}
