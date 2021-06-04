import 'package:flutter/widgets.dart';
import 'package:sonus/ui/screens/help/help.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/onboarding/onboadring.dart';
import 'package:sonus/ui/screens/onboarding/screens/hello_screen/hello_screen.dart';
import 'package:sonus/ui/screens/onboarding/screens/privacy_policy/privacy_policy.dart';
import 'package:sonus/ui/screens/privacy_policy/privacy_policy.dart';
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
  
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  HelloScreen.routeName: (context) => HelloScreen(),
  PrivacyPolicyReqScreen.routeName: (context) => PrivacyPolicyReqScreen(),

  RecordsGroupEditing.routeName: (context) => RecordsGroupEditing(),
  RecordsGroupsView.routeName: (context) => RecordsGroupsView(),
  RecordsView.routeName: (context) => RecordsView(),
  RecordView.routeName: (context) => RecordView(),

  QuickPhraseEditing.routeName: (context) => QuickPhraseEditing(),
  QuickPhrasesView.routeName: (context) => QuickPhrasesView(),

  Settings.routeName: (context) => Settings(),
  HelpScreen.routeName: (context) => HelpScreen(),
  PrivacyPolicyScreen.routeName: (context) => PrivacyPolicyScreen(),
};