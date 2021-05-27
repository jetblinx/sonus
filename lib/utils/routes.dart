import 'package:flutter/widgets.dart';
import 'package:sonus/ui/screens/notes/notes.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrases_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrase_view.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/ui/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Major.routeName: (context) => Major(),
  Settings.routeName: (context) => Settings(),
  Notes.routeName: (context) => Notes(),
  QuickPhrasesEditing.routeName: (context) => QuickPhrasesEditing(),
  QuickPhraseView.routeName: (context) => QuickPhraseView(),
  Splash.routeName: (context) => Splash(),
};