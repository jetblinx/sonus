import 'package:equatable/equatable.dart';

class RecordGroupModel extends Equatable {
  final int id;
  final String name;

  RecordGroupModel({this.id, this.name});

  factory RecordGroupModel.fromMap(Map<String, dynamic> row) => RecordGroupModel(
    id: row["id"],
    name: row["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name
  };

  RecordGroupModel copyWith({int id, String name}) {
    return RecordGroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [id, name];
}