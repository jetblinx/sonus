import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).settings,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: getProportionateScreenHeight(10),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).modules, style: Theme.of(context).textTheme.headline1),
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
              Divider(),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Text(AppLocalizations.of(context).settings_general, style: Theme.of(context).textTheme.headline1),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).language, style: Theme.of(context).textTheme.bodyText1),
                  Text(AppLocalizations.of(context).russian, style: Theme.of(context).textTheme.headline1)
                ]
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).dark_theme, style: Theme.of(context).textTheme.bodyText1),
                  Switch(
                    activeColor: Theme.of(context).backgroundColor,
                    activeTrackColor: Theme.of(context).primaryColor,
                    value: true, 
                    onChanged: (bool value) {}
                  )
                ]
              ),
            ]
          ),
        )
        
      ]),
    );
  }
}
