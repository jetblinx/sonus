import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/records_groups_cubit.dart';
import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/logger.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final RecordsGroupModel recordsGroup;

  const Body({Key key, this.recordsGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = recordsGroup != null ? recordsGroup.name : "";
    Logger.log(recordsGroup.toString());
    return Container(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                AppBar(
                  iconTheme: IconThemeData(
                    color: Theme.of(context).accentColor,
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(kIconDelete),
                      onPressed: () {
                        if (recordsGroup != null) {
                          BlocProvider.of<RecordsGroupsCubit>(context).delete(recordsGroup.id);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                  title: Text(recordsGroup != null ?
                    AppLocalizations.of(context).edit_records_group
                    : AppLocalizations.of(context).add_records_group,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0.0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
            child: Center(
              child: TextInputField(
                initialValue: text,
                maxLines: null,
                backgroundTransaprent: true,
                centerAlign: true,
                onChanged: (String value) {
                  text = value;
                },
              ),
            )
          )
        ),
        Container(
          child: IconButton(
            icon: Icon(
              kIconComplete,
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () {
              if (text.trim() != "") {
                if (recordsGroup != null) {
                  BlocProvider.of<RecordsGroupsCubit>(context).update(recordsGroup.copyWith(name: text.trim()));
                }
                else {
                  BlocProvider.of<RecordsGroupsCubit>(context).add(RecordsGroupModel(name: text.trim()));
                }
                Navigator.pop(context);
              }
            },
            iconSize: kSizeButtonComplete,
          ),
        ),
        SizedBox(
          child: Container(
          ),
          height: getProportionateScreenHeight(15),
        ),
      ]),
    );
  }
}
