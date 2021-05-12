import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            AppLocalizations.of(context).settings,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
        ),
      ]),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     AppLocalizations.of(context).settings,
      //     style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      // child: CustomScrollView(
      //     slivers: [
      //       SliverAppBar(
      //         iconTheme: IconThemeData(color: Colors.white),
      //         // FIXME: update text styles
      //         title: Text(AppLocalizations.of(context).settings, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
      //         actionsIconTheme: IconThemeData(color: Colors.white),
      //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //       ),
      //       SliverList(
      //         delegate: SliverChildListDelegate([
      //           Column(
      //             children: [

      //             ],
      //           )
      //         ])
      //       )
      //     ]
      //   )
    );
  }
}
