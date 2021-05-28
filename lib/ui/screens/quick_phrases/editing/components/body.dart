import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  final List chips = [
    "Hi",
    "Hello",
    "How are you? fdgdf gdfgdfgfdgf gfgfg fgfgfgffgh ffgfgfgfhghfg fgfg",
    "What's up?",
    "Go home",
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
  ];

  final String language = "ru-RU";

  @override
  Widget build(BuildContext context) {
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
                      AppLocalizations.of(context).editing_phrases,
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
              child: Stack(children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      ChipBuilder(
                        chips: chips,
                        onPress: "open",
                        language: language,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Container(
            child: TextInputField(
              controller: _controller,
              icon: Icon(
                kIconAdd,
                color: Theme.of(context).accentColor,
              ),
              isBorder: true,
            ),
          )
        ],
      ),
    );
  }
}
