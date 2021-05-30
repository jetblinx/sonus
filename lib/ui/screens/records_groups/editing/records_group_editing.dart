import 'package:flutter/material.dart';
import 'package:sonus/logic/models/record_group_model.dart';

import 'components/body.dart';

class RecordsGroupEditing extends StatelessWidget {
  static String routeName = "/records_group_editing";
  final RecordsGroupModel recordsGroup;

  const RecordsGroupEditing({Key key, this.recordsGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(recordsGroup: this.recordsGroup),
    );
  }
}