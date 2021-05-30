part of 'records_cubit.dart';

abstract class RecordsState extends Equatable {
  const RecordsState();

  @override
  List<Object> get props => [];
}

class RecordsInitialState extends RecordsState {}
class RecordsLoadedState extends RecordsState {
  final List<RecordModel> records;
  RecordsLoadedState(this.records);
}
