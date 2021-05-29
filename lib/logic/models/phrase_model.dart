import 'package:equatable/equatable.dart';

class PhraseModel extends Equatable {
  final int id;
  final String value;

  PhraseModel({this.id = 0, this.value});

  factory PhraseModel.fromMap(Map<String, dynamic> row) => PhraseModel(
    id: row["id"],
    value: row["value"],
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "value": this.value
  };

  PhraseModel copyWith({int id, String value}) {
    return PhraseModel(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [id, value];

}