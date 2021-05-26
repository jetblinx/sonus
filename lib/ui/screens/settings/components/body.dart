import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  bool asrOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
                child: AppBar(
                  iconTheme: IconThemeData(
                    color: Theme.of(context).accentColor,
                  ),
                  centerTitle: true,
                  title: Text(
                    AppLocalizations.of(context).settings,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(AppLocalizations.of(context).modules,
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).speech_recognition,
                              style: Theme.of(context).textTheme.headline2),
                          FlatSwitch(asrOn: asrOn),
                        ]),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).speech_to_text,
                              style: Theme.of(context).textTheme.headline2),
                          FlatSwitch(asrOn: asrOn),
                        ]),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Text(AppLocalizations.of(context).settings_general,
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).dark_theme,
                              style: Theme.of(context).textTheme.headline2),
                          FlatSwitch(asrOn: asrOn),
                        ]),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).language,
                              style: Theme.of(context).textTheme.headline2),
                          Text(AppLocalizations.of(context).russian,
                              style: Theme.of(context).textTheme.headline1)
                        ]),
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}

class FlatSwitch extends StatelessWidget {
  const FlatSwitch({
    Key key,
    @required this.asrOn,
  }) : super(key: key);

  final bool asrOn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: AnimatedContainer(
        duration: kDurationSwitch,
        curve: Curves.decelerate,
        width: kSizeSwitchWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: asrOn ? kColorPrimary : kColorSwitchGrey),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingSwitchCircle),
          child: AnimatedAlign(
            duration: kDurationSwitch,
            curve: Curves.decelerate,
            alignment: asrOn ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: kSizeSwitchCircle,
              height: kSizeSwitchCircle,
              decoration: BoxDecoration(
                  color: kColorWhite, borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ),
      ),
    );
  }
}
