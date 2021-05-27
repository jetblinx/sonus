import 'package:sonus/logic/dao/settings_dao.dart';
import 'package:sonus/logic/models/settings_model.dart';

class SettingsRepository {
  final SettingsDao _dao = SettingsDao();

  Future<SettingsModel> get settings async => await _dao.getSettings();
  Future<int> update(SettingsModel settings) async => await _dao.updateSettings(settings);
}