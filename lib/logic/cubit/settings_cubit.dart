import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/logic/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository = SettingsRepository();

  SettingsCubit() : super(SettingsInitialState()) {
    load();
  }

  Future<void> load() async {
    try {
      if (state is SettingsCurrentState) {
        emit(SettingsPrevState(state: state));
      } else {
        emit(SettingsInitialState());
      }
      print(state.toString());
      final settings = await _repository.settings;
      emit(SettingsCurrentState(settings));
      print(state.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(SettingsModel settings) async {
    emit(SettingsPrevState(state: state));
    await _repository.update(settings);
    load();
  }
}
