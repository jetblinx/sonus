import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  static void launchURL(_url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  static void launchPrivacyPolicy() async =>
    await canLaunch("https://jetblinx.github.io/sonus/privacy_policy.html") ? await launch("https://jetblinx.github.io/sonus/privacy_policy.html") : throw 'Could not launch Privacy Policy';

  static void launchTermsOfService() async =>
    await canLaunch("https://jetblinx.github.io/sonus/terms_of_service.html") ? await launch("https://jetblinx.github.io/sonus/terms_of_service.html") : throw 'Could not launch Privacy Policy';
}