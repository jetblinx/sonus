import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              // FIXME: update text styles
              title: Text(AppLocalizations.of(context).settings, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400)),
              actionsIconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    
                  ],
                ) 
              ])
            )
          ]
        )
    );
  }
}