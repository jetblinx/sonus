import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  final int id;
  final int language;
  final int theme;
  final int speechRecognition;
  final int textToSpeech;
  final int quickTts;
  final String languageCode;
  final String localeCode;
  final int onboardingShown;

  SettingsModel({this.id = 1, this.language, this.theme, this.speechRecognition, this.textToSpeech, this.quickTts, this.languageCode, this.localeCode, this.onboardingShown});

  factory SettingsModel.fromMap(Map<String, dynamic> row) => SettingsModel(
    id: row["id"],
    language: row["language"],
    theme: row["theme"],
    speechRecognition: row["speech_recognition"],
    textToSpeech: row["text_to_speech"],
    quickTts: row["quick_tts"],
    languageCode: row["language_code"],
    localeCode: row["tts_code"],
    onboardingShown: row['onboarding_shown']
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "language": this.language,
    "theme": this.theme,
    "speech_recognition": this.speechRecognition,
    "text_to_speech": this.textToSpeech,
    "quick_tts": this.quickTts,
    "onboarding_hown": this.onboardingShown
  };

  SettingsModel copyWith(SettingsModel settings) {
    return SettingsModel(
      id: settings.id != null ? settings.id : this.id,
      language: settings.language ?? this.language,
      theme: settings.theme != 0 || settings.theme != null ? settings.theme : this.theme,
      speechRecognition: settings.speechRecognition != null ? settings.speechRecognition : this.speechRecognition,
      textToSpeech: settings.textToSpeech != null ? settings.textToSpeech : this.textToSpeech,
      quickTts: settings.quickTts != null ? settings.quickTts : this.quickTts,
      languageCode: settings.languageCode ?? this.languageCode,
      localeCode: settings.localeCode ?? this.localeCode,
      onboardingShown: settings.onboardingShown ?? this.onboardingShown
    );
  }

  @override
  List<Object> get props => [language, theme, speechRecognition, textToSpeech, quickTts, onboardingShown];

  @override
  String toString() {
    return '''SettingsModel(
    id: ${this.id},
    language: ${this.language},
    theme: ${this.theme},
    speechRecognition: ${this.speechRecognition},
    textToSpeech: ${this.textToSpeech},
    quickTts: ${this.quickTts},
    languageCode: ${this.languageCode},
    localeCode: ${this.localeCode},
    onboardingShown: ${this.onboardingShown}
    )''';
  }
}