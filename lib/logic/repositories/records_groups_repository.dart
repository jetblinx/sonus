import 'package:sonus/logic/dao/records_groups_dao.dart';
import 'package:sonus/logic/models/record_group_model.dart';

class RecordsGroupsRepository {
  final RecordsGroupsDao _dao = RecordsGroupsDao();

  Future<List<RecordsGroupModel>> get recordsGroups async  => await _dao.getRecordsGroups();
  Future<int> add(RecordsGroupModel recordGroupModel) async => await _dao.add(recordGroupModel);
  Future<int> update(RecordsGroupModel recordGroupModel) async => _dao.update(recordGroupModel);
  Future<int> delete(int id) async => _dao.delete(id);
}