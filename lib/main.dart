import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sonus/logic/repositories/themes_repository.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/utils/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white, //Nav bar
      systemNavigationBarIconBrightness: Brightness.dark, //Nav bar icons
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sonus',
      themeMode: ThemeMode.light,
      theme: ThemesRepisotory.light,
      darkTheme: ThemesRepisotory.dark,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      initialRoute: Settings.routeName,
      routes: routes,
    );
  }
}
