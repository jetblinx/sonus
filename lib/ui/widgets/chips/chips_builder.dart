import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrases_editing.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrase_view.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';

class ChipBuilder extends StatelessWidget {
  final List chips;
  final String onPress;

  const ChipBuilder({Key key, this.chips, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        children: chips
            .map((chip) => chip is String
                ? ActionChip(
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                        vertical: getProportionateScreenHeight(2)),
                    label: Text(
                      chip,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    // avatar: CircleAvatar(
                    //   child: Text("😎"),
                    //   backgroundColor: Colors.white,
                    // ),
                    onPressed: () {
                      onPress != "open"
                          ? {
                              HapticFeedback.lightImpact(),
                              print(chip),
                            }
                          : Navigator.pushNamed(
                              context, QuickPhraseView.routeName);
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
