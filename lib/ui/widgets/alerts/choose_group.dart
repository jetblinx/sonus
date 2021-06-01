import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/records_groups_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<int> chooseGroup(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<RecordsGroupsCubit, RecordsGroupsState>(
            builder: (context, recordsGroupsState) {
          if (recordsGroupsState is RecordsGroupsLoadedState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0.0,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context).close,
                      style: Theme.of(context).textTheme.headline3,
                    )),
              ],
              title: Text(AppLocalizations.of(context).choose_group,
                  style: Theme.of(context).textTheme.headline3),
              content: Container(
                width: MediaQuery.of(context).size.width / 0.5,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: recordsGroupsState.recordsGroups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context,
                            recordsGroupsState.recordsGroups[index].id);
                      },
                      child: ListTile(
                        title: Text(
                            recordsGroupsState.recordsGroups[index].name),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ),
            );
          }
          return Container();
        });
      });
  }