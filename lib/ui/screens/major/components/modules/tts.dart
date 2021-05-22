import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TTS extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //ListView(),
          TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: getProportionateScreenWidth(18)),
                hintText: AppLocalizations.of(context).input_text,
                labelStyle: TextStyle(fontSize: getProportionateScreenWidth(18)),
                icon: _controller.text.isEmpty ? null : Icon(FluentIcons.dismiss_24_regular),
                suffixIcon: Icon(FluentIcons.send_24_regular)),
            minLines: 1,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
