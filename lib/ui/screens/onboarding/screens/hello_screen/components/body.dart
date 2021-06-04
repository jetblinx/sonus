import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sonus/ui/screens/onboarding/screens/privacy_policy/privacy_policy.dart';
import 'package:sonus/ui/widgets/buttons/onboarding_button.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal * 2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(
              flex: 3,
            ),
            SvgPicture.asset(
              "assets/logo/logo_transparent.svg",
              color: Theme.of(context).accentColor,
              height: getProportionateScreenHeight(100),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context).hello,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    AppLocalizations.of(context).short_description,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  // Text(
                  //   AppLocalizations.of(context).sonus,
                  //   style: Theme.of(context).textTheme.headline6,
                  // ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  OnboardingButton(
                      label: AppLocalizations.of(context).continue_forward,
                      icon: Icon(kIconArrowRight),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, PrivacyPolicyReqScreen.routeName);
                      })
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
