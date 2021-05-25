import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';

class ChipBuilder extends StatelessWidget {
  final List chips;
  const ChipBuilder({Key key, this.chips}) : super(key: key);
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
                      print(chip);
                      HapticFeedback.lightImpact();
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
                        onPressed: () {},
                      ),
                      backgroundColor: kColorPrimary,
                    ),
                  ))
            .toList());
  }
}
