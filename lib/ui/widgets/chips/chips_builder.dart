import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrases_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrase_view.dart';
import 'package:sonus/utils/constants.dart';

class ChipBuilder extends StatelessWidget {
  final List chips;
  final String onPress;

  const ChipBuilder({Key key, this.chips, @required this.onPress})
      : super(key: key);

  void _sayQuickPhrase(chip) {
    HapticFeedback.lightImpact();
    print(chip);                     
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        children: chips
            .map((chip) => chip is String
                ? ActionChip(
                    label: Text(
                      chip,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: () {
                      onPress == "open"
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
