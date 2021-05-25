import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';

class ASR extends StatelessWidget {
  
  FlutterTts flutterTts = FlutterTts();
  Future _langs() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    print(languages);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: IconButton(
              iconSize: kSizeButtonMic,
              icon: Icon(
                kIconMic,
                color: Theme.of(context).buttonColor,
              ),
              // splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              onPressed: () => {_langs()}),
          //child: Text(""),
        ),
      ),
    );
  }
}
