import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable{
  final int id;
  final String name;
  final String code;

  LanguageModel({this.id = 0, this.name, this.code});

  factory LanguageModel.fromMap(Map<String, dynamic> row) => LanguageModel(
    id: row["id"],
    name: row["name"],
    code: row["language_code"]
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name,
    "language_code": this.code
  };

  LanguageModel copyWith({int id, String name, String code}) {
    return LanguageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code
    );
  }

  @override
  List<Object> get props => [id, name, code];
}