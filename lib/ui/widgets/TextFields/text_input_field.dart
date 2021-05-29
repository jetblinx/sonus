import 'package:flutter/material.dart';
import 'package:sonus/logic/repositories/TextField/text_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    Key key,
    this.icon,
    this.isBorder,
    this.backgroundTransaprent = false,
    this.centerAlign = false,
    this.maxLines = kSizeTextFieldLines,
  })  :  super(key: key);

  final Icon icon;
  final bool isBorder;
  final bool backgroundTransaprent;
  final bool centerAlign;
  final int maxLines;

  final TextBloc _textBloc = TextBloc();

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
        child: StreamBuilder(
            stream: _textBloc.textStream,
            builder: (ctxt, AsyncSnapshot<String> textStream) {
              return Form(
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: centerAlign ? TextAlign.center : TextAlign.start,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (String text) => _textBloc.updateText(text),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.headline3,
                      hintText: AppLocalizations.of(context).enter_text,
                      icon: textStream.hasError ? null : Icon(kIconDismiss),
                      suffixIcon: icon != null
                          ? IconButton(
                              icon: icon,
                              onPressed: () {},
                            )
                          : null),
                  minLines: 1,
                  maxLines: maxLines != null ? kSizeTextFieldLines : null,
                ),
              );
            }),
      ),
    );
  }
}
