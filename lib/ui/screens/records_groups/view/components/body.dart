import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/records_groups_cubit.dart';
import 'package:sonus/ui/screens/records_groups/editing/records_group_editing.dart';
import 'package:sonus/ui/screens/records_groups/records/group/records_view.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordsGroupsCubit, RecordsGroupsState>(
      listener: (context, recordsGroupsState) {
        if (recordsGroupsState is RecordsGroupsInitialState) BlocProvider.of<RecordsGroupsCubit>(context).load();
      },
      builder: (context, recordsGroupsState) {
        if (recordsGroupsState is RecordsGroupsLoadedState) {
          if (recordsGroupsState.recordsGroups.isNotEmpty) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                          ),
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
                              AppLocalizations.of(context).archive_of_records,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            actions: [
                              IconButton(
                                icon: Icon(kIconAdd, color: Theme.of(context).accentColor),
                                onPressed: () {
                                  Navigator.pushNamed(context, RecordsGroupEditing.routeName);
                                }
                              )
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
                      padding: EdgeInsets.symmetric(
                          horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 4 / 2,
                          ),
                          itemCount: recordsGroupsState.recordsGroups.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              customBorder: CircleBorder(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).colorScheme.background,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(kPaddingGroupContainer),
                                  child: Center(
                                    child: Text(
                                      recordsGroupsState.recordsGroups[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RecordsView(recordsGroup: recordsGroupsState.recordsGroups[index])));
                              },
                            );
                          }),
                    ),
                  )
                ],
              ),
            );
          }
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //color: Theme.of(context).backgroundColor,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Container(
                          //color: Theme.of(context).backgroundColor,
                        ),
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
                            AppLocalizations.of(context).archive_of_records,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                          actions: [
                            IconButton(
                              icon: Icon(kIconAdd, color: Theme.of(context).accentColor),
                              onPressed: () {
                              Navigator.pushNamed(context, RecordsGroupEditing.routeName);
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
                    child: Container(
                      child: Center(
                        child: Text(AppLocalizations.of(context).no_records_saved)
                      )
                    )
                  ),
                )
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
                      child: Container(
                      ),
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
                          AppLocalizations.of(context).archive_of_records,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(kIconAdd, color: Theme.of(context).accentColor),
                            onPressed: () {
                              Navigator.pushNamed(context, RecordsGroupEditing.routeName);
                            })
                        ],
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    
    
  }
}
