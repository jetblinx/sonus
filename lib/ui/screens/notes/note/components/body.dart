import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                    ),
                  ],
                  title: Text(
                    AppLocalizations.of(context).edit_phrase,
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
          child: TextInputField(
            maxLines: null,
            backgroundTransaprent: true,  
          ),
        )),
        Container(
          child: IconButton(
            icon: Icon(
              kIconComplete,
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () {},
            iconSize: kSizeButtonComplete,
          ),
        ),
      ]),
    );
  }
}
