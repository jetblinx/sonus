import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/screens/notes/note/note.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  List notes = [
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
                      AppLocalizations.of(context).notes,
                      style: Theme.of(context).textTheme.caption,
                    ),
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
                      Navigator.pushNamed(context, Note.routeName);
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
