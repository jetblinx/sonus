
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ru')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @continue_forward.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_forward;

  /// No description provided for @short_description.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition & synthesis tool'**
  String get short_description;

  /// No description provided for @sonus.
  ///
  /// In en, this message translates to:
  /// **'SONUS'**
  String get sonus;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @add_phrase.
  ///
  /// In en, this message translates to:
  /// **'Add phrase'**
  String get add_phrase;

  /// No description provided for @add_records_group.
  ///
  /// In en, this message translates to:
  /// **'Add records group'**
  String get add_records_group;

  /// No description provided for @archive_of_records.
  ///
  /// In en, this message translates to:
  /// **'Archive of records'**
  String get archive_of_records;

  /// No description provided for @editing_phrases.
  ///
  /// In en, this message translates to:
  /// **'Quick phrases'**
  String get editing_phrases;

  /// No description provided for @edit_phrase.
  ///
  /// In en, this message translates to:
  /// **'Edit phrase'**
  String get edit_phrase;

  /// No description provided for @edit_records_group.
  ///
  /// In en, this message translates to:
  /// **'Edit records group'**
  String get edit_records_group;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @enter_text.
  ///
  /// In en, this message translates to:
  /// **'Enter text'**
  String get enter_text;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @modules.
  ///
  /// In en, this message translates to:
  /// **'Modules'**
  String get modules;

  /// No description provided for @language_choosen.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_choosen;

  /// No description provided for @no_phrases.
  ///
  /// In en, this message translates to:
  /// **'No quick prases'**
  String get no_phrases;

  /// No description provided for @no_records_saved.
  ///
  /// In en, this message translates to:
  /// **'No records saved'**
  String get no_records_saved;

  /// No description provided for @no_records.
  ///
  /// In en, this message translates to:
  /// **'No records'**
  String get no_records;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @speech_recognition.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition'**
  String get speech_recognition;

  /// No description provided for @text_to_speech.
  ///
  /// In en, this message translates to:
  /// **'Text to speech'**
  String get text_to_speech;

  /// No description provided for @system_language.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system_language;

  /// No description provided for @dark_theme.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get dark_theme;

  /// No description provided for @settings_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settings_general;

  /// No description provided for @quick_tts.
  ///
  /// In en, this message translates to:
  /// **'Quick TTS'**
  String get quick_tts;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @note_groups.
  ///
  /// In en, this message translates to:
  /// **'Note Groups'**
  String get note_groups;

  /// No description provided for @record_name.
  ///
  /// In en, this message translates to:
  /// **'Record Name'**
  String get record_name;

  /// No description provided for @record_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get record_save;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @choose_group.
  ///
  /// In en, this message translates to:
  /// **'Choose group'**
  String get choose_group;

  /// No description provided for @record_added.
  ///
  /// In en, this message translates to:
  /// **'Record added'**
  String get record_added;

  /// No description provided for @record_edited.
  ///
  /// In en, this message translates to:
  /// **'Record edited'**
  String get record_edited;

  /// No description provided for @record_deleted.
  ///
  /// In en, this message translates to:
  /// **'Record deleted'**
  String get record_deleted;

  /// No description provided for @quick_phrase_added.
  ///
  /// In en, this message translates to:
  /// **'Quick phrase added'**
  String get quick_phrase_added;

  /// No description provided for @quick_phrase_edited.
  ///
  /// In en, this message translates to:
  /// **'Quick phrase edited'**
  String get quick_phrase_edited;

  /// No description provided for @quick_phrase_deleted.
  ///
  /// In en, this message translates to:
  /// **'Quick phrase deleted'**
  String get quick_phrase_deleted;

  /// No description provided for @record_group_added.
  ///
  /// In en, this message translates to:
  /// **'Records group added'**
  String get record_group_added;

  /// No description provided for @record_group_edited.
  ///
  /// In en, this message translates to:
  /// **'Records group edited'**
  String get record_group_edited;

  /// No description provided for @record_group_deleted.
  ///
  /// In en, this message translates to:
  /// **'Records group deleted'**
  String get record_group_deleted;

  /// No description provided for @phrase_copied.
  ///
  /// In en, this message translates to:
  /// **'Phrase copied'**
  String get phrase_copied;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get no_internet_connection;

  /// No description provided for @no_mic_permission.
  ///
  /// In en, this message translates to:
  /// **'Speech Recognition requires Microphone use'**
  String get no_mic_permission;

  /// No description provided for @grant_mic_permission.
  ///
  /// In en, this message translates to:
  /// **'Tap on icon to grant permission'**
  String get grant_mic_permission;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @help_stt_not_work.
  ///
  /// In en, this message translates to:
  /// **'Speech Recognition doesn\'t work'**
  String get help_stt_not_work;

  /// No description provided for @help_stt_not_work_solution.
  ///
  /// In en, this message translates to:
  /// **'Speech Recognition uses Google services to recognize your speech. If it doesn\'t work - find the Google app in the settings and give a microphone permission to it.'**
  String get help_stt_not_work_solution;

  /// No description provided for @help_tts_not_work.
  ///
  /// In en, this message translates to:
  /// **'Text-To-Speech doesn\'t work'**
  String get help_tts_not_work;

  /// No description provided for @help_tts_not_work_solution.
  ///
  /// In en, this message translates to:
  /// **'Speech to text uses Google Speech-to-text plugin for speech synthesis. It may not work if you haven\'t installed this plugin. Go to Google Play and search for Google Text-to-speech, then install it and reboot SONUS (close and open again).'**
  String get help_tts_not_work_solution;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @terms_of_service.
  ///
  /// In en, this message translates to:
  /// **'Terms Of Service'**
  String get terms_of_service;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations _lookupAppLocalizations(Locale locale) {
  


// Lookup logic when only language code is specified.
switch (locale.languageCode) {
  case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'ru': return AppLocalizationsRu();
}


  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
