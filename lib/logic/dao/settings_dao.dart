import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class SettingsDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;
  final String _table = "settings";

  Future<SettingsModel> getSettings() async {
    final db = await _databaseProvider.database;
    try {
      List<Map<String, dynamic>> result;
      result = await db.rawQuery('''
        SELECT $_table.id, $_table.language, $_table.theme, 
        $_table.speech_recognition, $_table.text_to_speech, 
        languages.language_code, languages.tts_code FROM $_table
        LEFT JOIN languages ON $_table.language=languages.id
      ''');
      return result.isNotEmpty ? result.map((e) => SettingsModel.fromMap(e)).toList().first : null;
    } catch (_) {
      print(_);
      return null;
    }
  }

  Future<int> updateSettings(SettingsModel settings) async {
    final db = await _databaseProvider.database;
    try {
      return await db.update(_table, settings.toMap());
    } catch (_) {
      print(_);
      return null;
    }
  }
}