import 'package:sonus/logic/dao/phrases_dao.dart';
import 'package:sonus/logic/models/phrase_model.dart';

class PhrasesRepository {
  final PhrasesDao _dao = PhrasesDao();

  Future<List<PhraseModel>> get phrases async => await _dao.getPhrases();
  Future<int> add(PhraseModel phrase) async => await _dao.add(phrase);
  Future<int> update(PhraseModel phrase) async => await _dao.update(phrase);
  Future<int> delete(int id) async => await _dao.delete(id);
}