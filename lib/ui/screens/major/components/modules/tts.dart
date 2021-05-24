import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sonus/ui/screens/major/components/chips.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TTS extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  List chips = [
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
    "Let's play",
    Icon(FluentIcons.add_20_filled,),
  ];

  Widget buildChips(context) => Wrap(
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
                  onPressed: () {
                    print(chip);
                    print(chips);
                  },
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                  ),
                  child: CircleAvatar(
                    child: IconButton(
                      splashRadius: 24,
                      icon: chip,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                ))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            constraints:
                BoxConstraints(maxHeight: getProportionateScreenHeight(150)),
            child: ListView(
              children: [
                buildChips(context),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: getProportionateScreenWidth(18)),
                hintText: AppLocalizations.of(context).input_text,
                labelStyle:
                    TextStyle(fontSize: getProportionateScreenWidth(18)),
                icon: _controller.text.isEmpty
                    ? null
                    : Icon(FluentIcons.dismiss_24_regular),
                suffixIcon: Icon(FluentIcons.send_24_regular)),
            minLines: 1,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
