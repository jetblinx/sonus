import 'package:flutter/material.dart';
import 'package:sonus/logic/models/record_model.dart';

import 'components/body.dart';

class RecordView extends StatelessWidget {
  static String routeName = "/record_view";
  final RecordModel record;

  const RecordView({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(record: this.record),
    );
  }
}