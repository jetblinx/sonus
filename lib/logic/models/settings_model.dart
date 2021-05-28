import 'package:equatable/equatable.dart';
import 'package:sonus/utils/logger.dart';

class SettingsModel extends Equatable {
  final int id;
  final int language;
  final int theme;
  final int speechRecognition;
  final int textToSpeech;

  SettingsModel({this.id = 1, this.language, this.theme, this.speechRecognition, this.textToSpeech});

  factory SettingsModel.fromMap(Map<String, dynamic> row) => SettingsModel(
    id: row["id"],
    language: row["language"],
    theme: row["theme"],
    speechRecognition: row["speech_recognition"],
    textToSpeech: row["text_to_speech"]
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "language": this.language,
    "theme": this.theme,
    "speech_recognition": this.speechRecognition,
    "text_to_speech": this.textToSpeech
  };

  SettingsModel copyWith(SettingsModel settings) {
    return SettingsModel(
      id: settings.id != null ? settings.id : this.id,
      language: settings.language ?? this.language,
      theme: settings.theme != 0 || settings.theme != null ? settings.theme : this.theme,
      speechRecognition: settings.speechRecognition != null ? settings.speechRecognition : this.speechRecognition,
      textToSpeech: settings.textToSpeech != null ? settings.textToSpeech : this.textToSpeech
    );
  }

  @override
  List<Object> get props => [language, theme, speechRecognition, textToSpeech];
}