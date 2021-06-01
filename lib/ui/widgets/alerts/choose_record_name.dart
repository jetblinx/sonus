import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/constants.dart';

Future<String> chooseRecordName(BuildContext context, TextEditingController _textFieldController) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context).close,
                      style: Theme.of(context).textTheme.headline3,
                    )),
                TextButton(
                    onPressed: () {
                      if (_textFieldController.text.isNotEmpty) {
                        Navigator.pop(context, _textFieldController.text);
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).record_save,
                      style: Theme.of(context).textTheme.headline3,
                    )),
              ],
            ),
          ],
          title: Text(AppLocalizations.of(context).record_name,
              style: Theme.of(context).textTheme.headline3),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).dividerColor),
            child: TextField(
              cursorColor: Theme.of(context).accentColor,
              onChanged: (value) {},
              controller: _textFieldController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.headline3,
                hintText: AppLocalizations.of(context).record_name,
              ),
            ),
          ),
        );
      });
  }