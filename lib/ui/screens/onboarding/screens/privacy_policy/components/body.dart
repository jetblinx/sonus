import 'package:flutter/material.dart';
import 'package:sonus/ui/screens/major/major.dart';
import 'package:sonus/ui/widgets/buttons/onboarding_button.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  child: Container(),
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
                      AppLocalizations.of(context).privacy_policy,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
                child: Column(
            children: [
                Divider(),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Text(
                        AppLocalizations.of(context).privacy_policy_content,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ),
                Divider(),
                OnboardingButton(
                  label: AppLocalizations.of(context).accept,
                  onPressed: () {Navigator.pushReplacementNamed(context, Major.routeName);},
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
            ],
          ),
              )),
        ],
      ),
    );
  }
}
