import 'package:flutter/widgets.dart';
import 'package:sonus/ui/screens/notes/group/group.dart';
import 'package:sonus/ui/screens/notes/groups/groups.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrases_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrase_view.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/ui/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {

  Splash.routeName: (context) => Splash(),
  Major.routeName: (context) => Major(),
  Settings.routeName: (context) => Settings(),

  Groups.routeName: (context) => Groups(),
  GroupView.routeName: (context) => GroupView(),

  QuickPhrasesEditing.routeName: (context) => QuickPhrasesEditing(),
  QuickPhraseView.routeName: (context) => QuickPhraseView(),

  
};