import 'package:sonus/logic/dao/records_dao.dart';
import 'package:sonus/logic/models/record_model.dart';

class RecordsRepository {
  final RecordsDao _dao = new RecordsDao();

  Future<List<RecordModel>> getRecordsByRecordsGroupId(int id) async => await _dao.getRecordsByRecordsGroupId(id);
  Future<List<RecordModel>> get records async => await _dao.getRecords();
  Future<int> add(RecordModel record) async => _dao.add(record);
  Future<int> delete(int id) async => _dao.delete(id);
}