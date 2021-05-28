import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrases_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrase_view.dart';
import 'package:sonus/utils/constants.dart';

class ChipBuilder extends StatefulWidget {
  final List chips;
  final String onPress;

  const ChipBuilder({Key key, this.chips, @required this.onPress,})
      : super(key: key);

  @override
  _ChipBuilderState createState() => _ChipBuilderState();
}

class _ChipBuilderState extends State<ChipBuilder> {

  FlutterTts flutterTts;
  Future<dynamic> _engine;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTts();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterTts.stop();
  }

  void _sayQuickPhrase(chip) async {
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(chip);
    HapticFeedback.lightImpact();
    print(chip);                     
  }

  _initTts() async {
    FlutterTts flutterTts = FlutterTts();
    _engine = await flutterTts.getDefaultEngine;
    flutterTts.setEngine(_engine.toString());
    print(_engine.toString());
    flutterTts.setLanguage("ru-RU");
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        children: widget.chips
            .map((chip) => chip is String
                ? ActionChip(
                    label: Text(
                      chip,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: () {
                      widget.onPress == "open"
                          ? Navigator.pushNamed(
                              context, QuickPhraseView.routeName)
                          : _sayQuickPhrase(chip);
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                    ),
                    child: CircleAvatar(
                      child: IconButton(
                        splashRadius: 24,
                        icon: chip,
                        color: Colors.white,
                        onPressed: () => Navigator.pushNamed(
                            context, QuickPhrasesEditing.routeName),
                      ),
                      backgroundColor: kColorPrimary,
                    ),
                  ))
            .toList());
  }
}
