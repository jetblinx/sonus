import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';

class ASR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: IconButton(
                iconSize: kButtonMicSize,
                  icon: Icon(
                    FluentIcons.mic_on_20_regular,
                    color: Theme.of(context).buttonColor,
                  ),
                  onPressed: () => {}),
          //child: Text(""),
        ),
      ),
    );
  }
}