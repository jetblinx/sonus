import 'package:flutter/widgets.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrase_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrases_view.dart';
import 'package:sonus/ui/screens/records_groups/editing/records_group_editing.dart';
import 'package:sonus/ui/screens/records_groups/records/group/records_view.dart';
import 'package:sonus/ui/screens/records_groups/records/record_view/record_view.dart';
import 'package:sonus/ui/screens/records_groups/view/records_groups_view.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/ui/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {

  Splash.routeName: (context) => Splash(),
  Major.routeName: (context) => Major(),
  Settings.routeName: (context) => Settings(),

  RecordsGroupEditing.routeName: (context) => RecordsGroupEditing(),
  RecordsGroupsView.routeName: (context) => RecordsGroupsView(),
  RecordsView.routeName: (context) => RecordsView(),
  RecordView.routeName: (context) => RecordView(),

  QuickPhraseEditing.routeName: (context) => QuickPhraseEditing(),
  QuickPhrasesView.routeName: (context) => QuickPhrasesView(),

};