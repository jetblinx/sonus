import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class RecordsGroupsDao {
  final DatabaseProvider _provider = DatabaseProvider.instance;
  final String _table = "records_groups";

  Future<List<RecordGroupModel>> getRecordsGroups() async {
    final db = await _provider.database;
    List<Map<String, dynamic>> result = await db.query(_table);
    return result.isNotEmpty
    ? result.map((e) => RecordGroupModel.fromMap(e))
    : null;
  }

  Future<int> add(RecordGroupModel recordGroupModel) async {
    final db = await _provider.database;
    return db.insert(_table, recordGroupModel.toMap());
  }

  Future<int> update(RecordGroupModel recordGroupModel) async {
    final db = await _provider.database;
    return db.update(_table, recordGroupModel.toMap());
  }

  Future<int> delete(int id) async {
    final db = await _provider.database;
    await db.delete("records", where: "group", whereArgs: [id]);
    return db.delete(_table, where: "id", whereArgs: [id]);
  }
}