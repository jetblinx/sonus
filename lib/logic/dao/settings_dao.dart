import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/logic/services/database_provider.dart';

class SettingsDao {
  final DatabaseProvider _databaseProvider = DatabaseProvider.instance;
  final String _table = "settings";

  Future<SettingsModel> getSettings() async {
    final db = await _databaseProvider.database;
    List<Map<String, dynamic>> result;
    result = await db.query(_table, limit: 1);
    return result.isNotEmpty ? result.map((e) => SettingsModel.fromMap(e)).toList()[0] : null;
  }

  Future<int> updateSettings(SettingsModel settings) async {
    final db = await _databaseProvider.database;
    final SettingsModel currentSettigs  = await getSettings();
    return db.update(_table, currentSettigs.copyWith(settings).toMap());
  }
}