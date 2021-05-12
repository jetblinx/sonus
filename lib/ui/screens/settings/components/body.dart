import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            AppLocalizations.of(context).settings,
            style: Theme.of(context).textTheme.caption
          ),
        ),
        SizedBox(
          height: 50,
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).modules, style: Theme.of(context).textTheme.headline1),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).speech_recognition, style: Theme.of(context).textTheme.bodyText1),
                  Switch(
                    activeColor: Theme.of(context).backgroundColor,
                    activeTrackColor: Theme.of(context).primaryColor,
                    value: true, 
                    onChanged: (bool value) {}
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).speech_to_text, style: Theme.of(context).textTheme.bodyText1),
                  Switch(
                    activeColor: Theme.of(context).backgroundColor,
                    activeTrackColor: Theme.of(context).primaryColor,
                    value: true, 
                    onChanged: (bool value) {}
                  )
                ]
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).language, style: Theme.of(context).textTheme.bodyText1),
                  Text(AppLocalizations.of(context).russian, style: Theme.of(context).textTheme.bodyText1)
                ]
              ),
            ]
          ),
        )
        
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
