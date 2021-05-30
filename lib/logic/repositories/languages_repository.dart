import 'package:sonus/logic/dao/language_dao.dart';
import 'package:sonus/logic/models/language_model.dart';

class LanguagesRepository {
  final LanguageDao _dao = new LanguageDao();

  Future<List<LanguageModel>> get languages async => await _dao.getLanguages();
  Future<String> languageCode (int id) async => await _dao.getLanguageCode(id);
}