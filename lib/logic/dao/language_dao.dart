import 'package:sonus/logic/models/language_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class LanguageDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;
  final String _table = "languages";

  Future<List<LanguageModel>> getLanguages() async {
    final db = await _databaseProvider.database;
    List<Map<String, dynamic>> result = await db.query(_table);
    return result.isNotEmpty
    ? result.map((e) => LanguageModel.fromMap(e)).toList()
    : [];
  }

  Future<String> getLanguageCode(int id) async {
    final db = await _databaseProvider.database;
    final result = await db.query(_table, columns: ["language_code"]);
    return result.isNotEmpty ?
    result.map((e) => LanguageModel.fromMap(e).languageCode) 
    : "";
  }
}