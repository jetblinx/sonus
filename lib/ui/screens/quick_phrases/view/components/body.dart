import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              centerTitle: true,
              actions: [
                IconButton(icon: Icon(kIconDelete), onPressed: () {},),
              ],
              title: Text(
                AppLocalizations.of(context).edit_phrase,
                style:
                    TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInputField(controller: _controller,),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}