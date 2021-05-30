part of 'records_groups_cubit.dart';

abstract class RecordsGroupsState extends Equatable {
  const RecordsGroupsState();

  @override
  List<Object> get props => [];
}

class RecordsGroupsInitialState extends RecordsGroupsState {}
class RecordsGroupsLoadedState extends RecordsGroupsState {
  final List<RecordsGroupModel> recordsGroups;
  RecordsGroupsLoadedState(this.recordsGroups);
}
