import 'package:sonus/logic/models/record_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class RecordsDao {
  final DatabaseProvider _provider = DatabaseProvider.instance;
  final String _table = "records";

  Future<List<RecordModel>> getRecords() async {
    final db = await _provider.database;
    List<Map<String, dynamic>> result = await db.query(_table);
    return result.isNotEmpty
    ? result.map((e) => RecordModel.fromMap(e))
    : [];
  }

  Future<List<RecordModel>> getRecordsByRecordsGroupId(int id) async {
    final db = await _provider.database;
    List<Map<String, dynamic>> result = await db.query(_table, where: "group_id", whereArgs: [id]);
    return result.isNotEmpty
    ? result.map((e) => RecordModel.fromMap(e))
    : [];
  }

  Future<int> add(RecordModel record) async {
    final db = await _provider.database;
    return await db.insert(_table, record.toMap());
  }

  Future<int> delete(int id) async {
    final db = await _provider.database;
    return await db.delete(_table, where: "id", whereArgs: [id]);
  }
}