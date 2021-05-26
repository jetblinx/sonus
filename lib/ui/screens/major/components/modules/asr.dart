import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';

class ASR extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();
  Future _langs() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    print(languages);
  }

  bool asrOn = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: asrOn
              ? Text(
                  "Recognizing... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
                  style: Theme.of(context).textTheme.caption,
                ) 
              : Container(
                  child: IconButton(
                      iconSize: kSizeButtonMic,
                      icon: Icon(
                        kIconMic,
                        color: Theme.of(context).buttonColor,
                      ),
                      // splashColor: Colors.transparent,
                      // highlightColor: Colors.transparent,
                      onPressed: () =>
                          {_langs(), HapticFeedback.lightImpact()}),
                )
        ),
      ),
    );
  }
}
