import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/screens/archive/components/field.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            AppLocalizations.of(context).editing_phrases,
            style: Theme.of(context).textTheme.caption
          ),
        ),
        SizedBox(
          height: 50,
        ),

        
      ]),
      bottomNavigationBar: Field(),
    );
  }
}