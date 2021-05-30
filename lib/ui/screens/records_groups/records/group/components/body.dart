import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/records_cubit.dart';
import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/ui/screens/records_groups/editing/records_group_editing.dart';
import 'package:sonus/ui/screens/records_groups/records/record_view/record_view.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final RecordsGroupModel recordsGroup;

  Body({Key key, this.recordsGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordsCubit, RecordsState>(
      listener: (context, recordsState) {
        if (recordsState is RecordsInitialState) BlocProvider.of<RecordsCubit>(context).recordsByRecordsGroupId(recordsGroup.id);
      },
      builder: (context, recordsState) {
        if (recordsState is RecordsLoadedState) {
          if (recordsState.records.isNotEmpty) {
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
                                recordsState.records[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RecordView(record: recordsState.records[index])));
                            },
                          );
                        },
                        itemCount: recordsState.records.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
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
                    child: Container(child: Center(child: Text(AppLocalizations.of(context).no_records_saved)))
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
    
    
  }
}
