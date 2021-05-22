import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Field extends StatefulWidget {
  Field({Key key}) : super(key: key);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool inFocus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.grey
          )
        )
      ),
      child: Form(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: TextFormField(
                onTap: () {
                  setState(() {
                    inFocus = true;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  hintText: AppLocalizations.of(context).enter_text,
                ),
              ),
            ),
            inFocus 
            ? IconButton(icon: Icon(Icons.send_outlined, color: Colors.grey), onPressed: () {})
            : IconButton(icon: Icon(Icons.add, color: Colors.grey), onPressed: () {})
          ],
        ),
      ),
    );
  }
}