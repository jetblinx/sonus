import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';

class FloatingSnackbar {
  static SnackBar floatingSnackBar(
      Icon icon, String text, String label, BuildContext context) {
    return SnackBar(
      duration: Duration(seconds: 4),
      elevation: 0.0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: label.toUpperCase(),
        textColor: Theme.of(context).accentColor,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
      content: Container(
        child: Row(
          children: [
            icon,
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Flexible(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
