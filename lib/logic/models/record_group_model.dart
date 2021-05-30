import 'package:equatable/equatable.dart';

class RecordsGroupModel extends Equatable {
  final int id;
  final String name;

  RecordsGroupModel({this.id, this.name});

  factory RecordsGroupModel.fromMap(Map<String, dynamic> row) => RecordsGroupModel(
    id: row["id"],
    name: row["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name
  };

  RecordsGroupModel copyWith({int id, String name}) {
    return RecordsGroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [id, name];
}