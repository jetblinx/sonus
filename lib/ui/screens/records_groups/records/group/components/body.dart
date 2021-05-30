import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/ui/screens/records_groups/editing/records_group_editing.dart';
import 'package:sonus/ui/screens/records_groups/records/record_view/record_view.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final RecordsGroupModel recordsGroup;


  final List notes = [
    'Default',
    'Friends',
    'School',
    'Food',
    'Default',
    'Friends',
    'School',
    'Food',
    'Default',
    'Friends',
    'School',
    'Food',
  ];

  Body({Key key, this.recordsGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  child: Container(),
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
                  child: AppBar(
                    iconTheme: IconThemeData(
                      color: Theme.of(context).accentColor,
                    ),
                    centerTitle: true,
                    title: Text(
                      recordsGroup.name,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    actions: [
                      IconButton(
                      icon: Icon(kIconEdit),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RecordsGroupEditing(recordsGroup: recordsGroup,)));
                      },
                    ),
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    customBorder: CircleBorder(),
                    child: ListTile(
                      title: Text(
                        notes[index],
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecordView()));
                    },
                  );
                },
                itemCount: notes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
