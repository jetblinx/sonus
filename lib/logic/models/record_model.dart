import 'package:equatable/equatable.dart';

class RecordModel extends Equatable {
  final int id;
  final String value;
  final int group;

  RecordModel({this.id, this.value, this.group});

  factory RecordModel.fromMap(Map<String, dynamic> row) => RecordModel(
    id: row["id"],
    value: row["value"],
    group: row["group"]
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "value": this.value,
    "group": this.group
  };

  RecordModel copyWith({int id, String text, String group}) {
    return RecordModel(
      id: id ?? this.id,
      value: value ?? this.value,
      group: group ?? this.group
    );
  }

  @override
  List<Object> get props => [id, value, group];
}