import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class PhrasesDao {
  final DatabaseProvider _provider = DatabaseProvider.instance;
  final String _table = "phrases";

  Future<List<PhraseModel>> getPhrases() async {
    final db = await _provider.database;
    List<Map<String, dynamic>> result = await db.query(_table);
    return result.isNotEmpty
    ? result.map((e) => PhraseModel.fromMap(e)).toList()
    : [];
  }

  Future<int> add(PhraseModel phrase) async {
    final db = await _provider.database;
    return await db.rawInsert('''
      INSERT INTO $_table(value) VALUES ("${phrase.value}") 
    ''');
  }

  Future<int> update(PhraseModel phrase) async {
    final db = await _provider.database;
    return await db.rawUpdate('''
      UPDATE $_table SET value="${phrase.value}" WHERE id=${phrase.id}
    ''');
  }

  Future<int> delete(int id) async {
    final db = await _provider.database;
    return await db.rawDelete('''
      DELETE FROM $_table WHERE id=$id   
    ''');
  }
}