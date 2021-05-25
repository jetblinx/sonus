import 'package:flutter/material.dart';
import 'package:sonus/ui/screens/archive/archive.dart';
import 'package:sonus/ui/screens/major/components/modules/tts.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrases_editing.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

import 'modules/asr.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
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
                        kIconBookmark,
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, QuickPhrasesEditing.routeName)),
                  IconButton(
                      icon: Icon(
                        kIconFolder,
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, Archive.routeName)),
                  IconButton(
                      icon: Icon(
                        kIconSettings,
                        color: Theme.of(context).buttonColor,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, Settings.routeName)),
                ],
              ),
              Spacer(),
              ASR(),
              Spacer(),
              Divider(
                height: 1,
              ),
              TTS(),
              //SizedBox(height: getProportionateScreenHeight(10))
            ],
          )),
    );
  }
}
