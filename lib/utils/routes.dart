import 'package:flutter/widgets.dart';
import 'package:sonus/ui/screens/archive/archive.dart';

import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/screens/settings/settings.dart';

final Map<String, WidgetBuilder> routes = {
  Major.routeName: (context) => Major(),
  Settings.routeName: (context) => Settings(),
  Archive.routeName: (context) => Archive()
};