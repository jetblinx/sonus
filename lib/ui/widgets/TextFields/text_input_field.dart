import 'package:flutter/material.dart';
import 'package:sonus/logic/repositories/TextField/text_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    Key key,
    @required TextEditingController controller,
    this.icon,
    this.isBorder,
    this.backgroundTransaprent = false,
    this.centerAlign = false,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final Icon icon;
  final bool isBorder;
  final bool backgroundTransaprent;
  final bool centerAlign;

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
                    width: 1.0,
                    color: Theme.of(context).dividerColor))
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
        child: TextField(
          textAlign: centerAlign ? TextAlign.center : TextAlign.start,
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          onChanged: (String text) => _textBloc.updateText(text),
          //cursorColor: Colors.black,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.headline2,
              hintText: AppLocalizations.of(context).enter_text,
              labelStyle: Theme.of(context).textTheme.headline2,
              icon: _controller.text.isEmpty ? null : Icon(kIconDismiss),
              suffixIcon: icon != null
                  ? IconButton(
                      icon: icon,
                      onPressed: () {},
                    )
                  : null),
          minLines: 1,
          maxLines: kSizeTextFieldLines,
        ),
      ),
    );
  }
}
