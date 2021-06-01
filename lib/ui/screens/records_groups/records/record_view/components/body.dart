import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/records_cubit.dart';
import 'package:sonus/logic/models/record_model.dart';
import 'package:sonus/ui/widgets/recognized_widgets_list.dart';
import 'package:sonus/ui/widgets/snackbars/snackbar.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final RecordModel record;

  const Body({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List archiveSpeech = record.value.split("|");
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
                      record.name,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(kIconDelete),
                        onPressed: () {
                          BlocProvider.of<RecordsCubit>(context)
                              .delete(record.id);
                          Navigator.pop(context);
                          final snackBar = FloatingSnackbar.floatingSnackBar(
                            Icon(
                              kIconDelete,
                              color: Theme.of(context).accentColor,
                            ),
                            AppLocalizations.of(context).record_deleted,
                            AppLocalizations.of(context).close,
                            context);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Navigator.pushNamed(context, RecordsGroupsView.routeName);
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
              child: RecognizedPhrasesList(archiveSpeech: archiveSpeech),
            ),
          ))
        ],
      ),
    );
  }
}
