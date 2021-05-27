import 'package:equatable/equatable.dart';

class RecordModel extends Equatable {
  final int id;
  final String text;
  final int group;

  RecordModel({this.id, this.text, this.group});

  factory RecordModel.fromMap(Map<String, dynamic> row) => RecordModel(
    id: row["id"],
    text: row["text"],
    group: row["group"]
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "text": this.text,
    "group": this.group
  };

  RecordModel copyWith({int id, String text, String group}) {
    return RecordModel(
      id: id ?? this.id,
      text: text ?? this.text,
      group: group ?? this.group
    );
  }

  @override
  List<Object> get props => [id, text, group];
}