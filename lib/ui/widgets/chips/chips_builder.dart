import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/models/phrase_model.dart';

class ChipBuilder extends StatelessWidget {
  final List<PhraseModel> phrases;
  final String onPress;
  final void Function(PhraseModel) onPressed;
  final FlutterTts flutterTts;
  final String language;

  const ChipBuilder({Key key, this.phrases, @required this.onPress, this.onPressed, this.flutterTts, @required this.language})
      : super(key: key);

  void _speak(PhraseModel phrase) async {
    HapticFeedback.lightImpact();
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.9);
    await flutterTts.speak(phrase.value);
    print(phrase.value);                     
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        children: phrases.isNotEmpty ? 
        phrases.map((PhraseModel phrase) => ActionChip(
        label: Text(
          phrase.value,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onPressed: () {
          if (onPress == "open") {
            onPressed(phrase);
          } else {
            _speak(phrase);
          }
        },
      )).toList()
    : []);
  }
}
