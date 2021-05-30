import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable{
  final int id;
  final String name;
  final String languageCode;
  final String ttsCode;

  LanguageModel({this.id = 0, this.name, this.languageCode, this.ttsCode});

  factory LanguageModel.fromMap(Map<String, dynamic> row) => LanguageModel(
    id: row["id"],
    name: row["name"],
    languageCode: row["language_code"],
    ttsCode: row["tts_code"]
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name,
    "language_code": this.languageCode,
    "tts_code": this.ttsCode
  };

  LanguageModel copyWith({int id, String name, String languageCode, String ttsCode}) {
    return LanguageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      languageCode: languageCode ?? this.languageCode,
      ttsCode: ttsCode ?? this.ttsCode
    );
  }

  @override
  List<Object> get props => [id, name, languageCode];
}