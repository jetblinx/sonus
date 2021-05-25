import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter/services.dart';

class TTS extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  List chips = [
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
    Icon(
      FluentIcons.add_20_filled,
    ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 0, maxHeight: kSizeBlockChips),
            child: Scrollbar(
              radius: Radius.circular(20),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: kPaddingBlockChips,),
                  buildChips(context),
                  SizedBox(height: kPaddingBlockChips,),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          TextInputField(controller: _controller),
        ],
      ),
    );
  }
}
