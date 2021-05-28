import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  final int id;
  final int language;
  final bool theme;
  final bool speechRecognition;
  final bool speechToText;

  SettingsModel({this.id = 1, this.language, this.theme, this.speechRecognition, this.speechToText});

  factory SettingsModel.fromMap(Map<String, dynamic> row) => SettingsModel(
    id: row["id"],
    language: row["language"],
    theme: row["theme"] == 1 ? true : false,
    speechRecognition: row["speech_recognition"] == 0 ? false : true,
    speechToText: row["speech_to_text"] == 0 ? false : true
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "language": this.language,
    "theme": this.theme ? 1 : 0,
    "speech_recognition": this.speechRecognition ? 1 : 0,
    "speech_to_text": this.speechToText ? 1 : 0
  };

  SettingsModel copyWith(SettingsModel settings) {
    return SettingsModel(
      id: settings.id ?? this.id,
      language: settings.language ?? this.language,
      speechRecognition: settings.speechRecognition ?? this.speechRecognition,
      speechToText: settings.speechToText ?? this.speechToText
    );
  }

  @override
  List<Object> get props => [language, theme, speechRecognition, speechToText];
}