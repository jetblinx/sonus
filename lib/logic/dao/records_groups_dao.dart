import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class RecordsGroupsDao {
  final DatabaseProvider _provider = DatabaseProvider.instance;
  final String _table = "records_groups";

  Future<List<RecordsGroupModel>> getRecordsGroups() async {
    final db = await _provider.database;
    List<Map<String, dynamic>> result = await db.query(_table);
    return result.isNotEmpty
    ? result.map((e) => RecordsGroupModel.fromMap(e)).toList()
    : [];
  }

  Future<int> add(RecordsGroupModel recordGroupModel) async {
    final db = await _provider.database;
    return db.insert(_table, recordGroupModel.toMap());
  }

  Future<int> update(RecordsGroupModel recordGroupModel) async {
    final db = await _provider.database;
    return db.rawUpdate('''
      UPDATE $_table SET name='${recordGroupModel.name}' WHERE id=${recordGroupModel.id}
    ''');
  }

  Future<int> delete(int id) async {
    final db = await _provider.database;
    await db.rawDelete('''
      DELETE FROM records WHERE group_id=$id
    ''');
    return db.rawDelete('''
      DELETE FROM $_table WHERE id=$id
    ''');
  }
}