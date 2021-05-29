import 'package:flutter/widgets.dart';
import 'package:sonus/ui/screens/notes/group/group.dart';
import 'package:sonus/ui/screens/notes/groups/groups.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/notes/note/note.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrase_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrases_view.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/ui/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {

  Splash.routeName: (context) => Splash(),
  Major.routeName: (context) => Major(),
  Settings.routeName: (context) => Settings(),

  Groups.routeName: (context) => Groups(),
  GroupView.routeName: (context) => GroupView(),
  Note.routeName: (context) => Note(),

  QuickPhraseEditing.routeName: (context) => QuickPhraseEditing(),
  QuickPhrasesView.routeName: (context) => QuickPhrasesView(),
};