import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onPressed;

  const OnboardingButton({
    Key key,
    @required this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        primary: Theme.of(context).accentColor,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        side: BorderSide(
            width: 0, color: Theme.of(context).scaffoldBackgroundColor),
      ),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kPaddingAllHorizontal, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? SizedBox(width: 40) : Container(),
              Text(
                label,
                style: Theme.of(context).textTheme.headline6,
              ),
              icon != null
                  ? Container(
                      child: Row(
                      children: [
                        SizedBox(width: 15),
                        icon,
                      ],
                    ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
