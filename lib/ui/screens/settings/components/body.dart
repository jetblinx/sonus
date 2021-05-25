import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  bool asr_on = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  centerTitle: true,
                  title: Text(
                    AppLocalizations.of(context).settings,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w800),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          FlatSwitch(asr_on: asr_on),
                        ]),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).speech_to_text,
                              style: Theme.of(context).textTheme.headline2),
                          FlatSwitch(asr_on: asr_on),
                        ]),
                    Divider(),
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
                          FlatSwitch(asr_on: asr_on),
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
          )
        ]),
      ),
    );
  }
}

class FlatSwitch extends StatelessWidget {
  const FlatSwitch({
    Key key,
    @required this.asr_on,
  }) : super(key: key);

  final bool asr_on;

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
            color: asr_on ? kColorPrimary : kColorSwitchGrey),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingSwitchCircle),
          child: AnimatedAlign(
            duration: kDurationSwitch,
            curve: Curves.decelerate,
            alignment: asr_on ? Alignment.centerRight : Alignment.centerLeft,
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
