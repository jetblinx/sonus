import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/logic/repositories/records_groups_repository.dart';

part 'records_groups_state.dart';

class RecordsGroupsCubit extends Cubit<RecordsGroupsState> {
  final RecordsGroupsRepository _repository = RecordsGroupsRepository();
  RecordsGroupsCubit() : super(RecordsGroupsInitialState()) {
    load();
  }

  Future<void> load() async {
    emit(RecordsGroupsInitialState());
    final recordsGroups = await _repository.recordsGroups;
    emit(RecordsGroupsLoadedState(recordsGroups));
  }

  Future<void> add(RecordsGroupModel recordsGroup) async {
    emit(RecordsGroupsInitialState());
    await _repository.add(recordsGroup);
    load();
  }

  Future<void> update(RecordsGroupModel recordsGroup) async {
    emit(RecordsGroupsInitialState());
    await _repository.update(recordsGroup);
    load();
  }

  Future<void> delete(int id) async {
    emit(RecordsGroupsInitialState());
    await _repository.delete(id);
    load();
  }
}
