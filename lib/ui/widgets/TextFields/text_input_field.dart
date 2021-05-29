import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/icons.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {Key key,
      this.icon,
      this.isBorder,
      this.backgroundTransaprent = false,
      this.centerAlign = false,
      this.onPressed,
      this.maxLines = kSizeTextFieldLines,
      this.onChanged,
      this.autoClear = false,
      this.initialValue,
      this.controller})
      : super(key: key);

  final TextEditingController controller;
  final bool autoClear;
  final void Function(String) onChanged;
  final Function onPressed;
  final String initialValue;
  final Icon icon;
  final bool isBorder;
  final bool backgroundTransaprent;
  final bool centerAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundTransaprent
            ? Colors.transparent
            : Theme.of(context).backgroundColor,
        border: isBorder != null
            ? Border(
                top: BorderSide(
                    width: 1.0, color: Theme.of(context).dividerColor))
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
        child: Form(
          child: TextFormField(
            controller: controller,
            initialValue: initialValue,
            style: Theme.of(context).textTheme.headline3,
            textAlign: centerAlign ? TextAlign.center : TextAlign.start,
            textCapitalization: TextCapitalization.sentences,
            onChanged: onChanged,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.headline3,
                hintText: AppLocalizations.of(context).enter_text,
                suffixIcon: icon != null
                    ? IconButton(
                        icon: icon,
                        onPressed: () {
                          onPressed();
                          if (autoClear) {
                            controller.clear();
                          }
                        },
                      )
                    : null),
            minLines: 1,
            maxLines: maxLines != null ? kSizeTextFieldLines : null,
          ),
        ),
      ),
    );
  }
}
