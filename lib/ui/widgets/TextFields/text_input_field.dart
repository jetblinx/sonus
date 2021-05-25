import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key key,
    @required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.headline2,
          hintText: AppLocalizations.of(context).input_text,
          labelStyle: Theme.of(context).textTheme.headline2,
          icon: _controller.text.isEmpty ? null : Icon(kIconDismiss),
          suffixIcon: IconButton(icon: Icon(kIconSend), onPressed: () {},)),
      minLines: 1,
      maxLines: kSizeTextFieldLines,
    );
  }
}