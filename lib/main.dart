import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sonus/logic/repositories/themes_repository.dart';
import 'package:sonus/utils/remove_scroll_glow.dart';
import 'package:sonus/utils/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'ui/screens/major/major.dart';
void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  final bool darkTheme = true;

  @override
  Widget build(BuildContext context) {

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

      themeMode: darkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemesRepisotory.light,
      darkTheme: ThemesRepisotory.dark,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      initialRoute: Major.routeName,
      routes: routes,
    );
  }
}