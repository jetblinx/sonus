import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/record_model.dart';
import 'package:sonus/logic/repositories/records_repository.dart';

part 'records_state.dart';

class RecordsCubit extends Cubit<RecordsState> {
  final RecordsRepository _repository = RecordsRepository();
  RecordsCubit() : super(RecordsInitialState()) {
    load();
  }

  Future<void> load() async {
    emit(RecordsInitialState());
    final records = await _repository.records;
    emit(RecordsLoadedState(records));
  }

  Future<void> add(RecordModel record) async {
    await _repository.add(record);
    load();
  }

  Future<void> delete(int id) async {
    await _repository.delete(id);
    load();
  }

  Future<void> recordsByRecordsGroupId(int id) async { 
    await _repository.getRecordsByRecordsGroupId(id);
    final records = await _repository.records;
    emit(RecordsLoadedState(records));
  }
}
