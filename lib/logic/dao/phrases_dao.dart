import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class PhrasesDao {
  final DatabaseProvider _provider = DatabaseProvider.instance;
  final String _table = "phrases";

  Future<List<PhraseModel>> getPhrases() async {
    final db = await _provider.database;
    List<Map<String, dynamic>> result = await db.query(_table);
    return result.isNotEmpty
    ? result.map((e) => PhraseModel.fromMap(e))
    : null;
  }

  Future<int> add(PhraseModel phrase) async {
    final db = await _provider.database;
    return await db.insert(_table, phrase.toMap());
  }

  Future<int> update(PhraseModel phrase) async {
    final db = await _provider.database;
    return await db.update(_table, phrase.toMap());
  }

  Future<int> delete(int id) async {
    final db = await _provider.database;
    return await db.delete(_table, where: "id", whereArgs: [id]);
  }
}