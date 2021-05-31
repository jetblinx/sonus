import 'package:equatable/equatable.dart';

class RecordModel extends Equatable {
  final int id;
  final String name;
  final String value;
  final int groupId;

  RecordModel({this.id, this.name, this.value, this.groupId});

  factory RecordModel.fromMap(Map<String, dynamic> row) => RecordModel(
    id: row["id"],
    name: row["name"],
    value: row["value"],
    groupId: row["group_id"]
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name,
    "value": this.value,
    "group_id": this.groupId
  };

  RecordModel copyWith({int id, String name, String value, int groupId}) {
    return RecordModel(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      groupId: groupId ?? this.groupId
    );
  }

  @override
  List<Object> get props => [id, name, value, groupId];
}