import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  List chips = [
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
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  AppBar(
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    centerTitle: true,
                    title: Text(
                      AppLocalizations.of(context).editing_phrases,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w800),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  Divider(
                    height: 1,
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
                    child: ChipBuilder(
                      chips: chips,
                      onPress: "open",
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              child: TextInputField(
                controller: _controller,
                icon: Icon(kIconAdd),
                isBorder: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
