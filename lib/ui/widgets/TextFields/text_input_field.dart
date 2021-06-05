import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      this.controller,
      this.suffixIcon,
      this.onDismiss,
      this.enableSuggestions})
      : super(key: key);

  final TextEditingController controller;
  final bool autoClear;
  final bool enableSuggestions;
  final void Function(String) onChanged;
  final Function onPressed;
  final Function onDismiss;
  final String initialValue;
  final Icon icon;
  final Icon suffixIcon;
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
            enableSuggestions: enableSuggestions == false ? false : true,
            keyboardType: enableSuggestions == false ? TextInputType.visiblePassword : null,
            initialValue: initialValue,
            style: backgroundTransaprent ? Theme.of(context).textTheme.caption : Theme.of(context).textTheme.headline3,
            textAlign: centerAlign ? TextAlign.center : TextAlign.start,
            textCapitalization: TextCapitalization.sentences,
            onChanged: onChanged,
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: backgroundTransaprent ? Theme.of(context).textTheme.caption : Theme.of(context).textTheme.headline3,
                hintText: AppLocalizations.of(context).enter_text,
                icon: icon != null
                    ? IconButton(
                        icon: icon,
                        onPressed: () {
                          if (autoClear) {
                            controller.clear();
                          }
                          onDismiss();
                        })
                    : null,
                suffixIcon: suffixIcon != null
                    ? IconButton(
                        icon: suffixIcon,
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
