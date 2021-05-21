import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sonus/ui/screens/major/components/modules/tts.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';

import 'modules/asr.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(
                        FluentIcons.bookmark_20_filled,
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () => {}),
                  IconButton(
                      icon: Icon(
                        FluentIcons.folder_20_filled,
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        FluentIcons.settings_20_filled,
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, Settings.routeName)),
                ],
              ),
              Spacer(flex: 3),
              ASR(),
              Spacer(flex: 4,),
              Divider(),
              TTS(),
              SizedBox(height: getProportionateScreenHeight(10))
            ],
          )),
    );
  }
}
