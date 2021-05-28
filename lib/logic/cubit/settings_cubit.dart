import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/logic/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository = new SettingsRepository();

  SettingsCubit() : super(SettingsInitialState()) {
    load();
  }

  Future<void> load() async {
    try {
      final settings = await _repository.settings;
      emit(SettingsLoadedState(settings: settings));
      print(settings);
    } catch (err) {
      emit(SettingsErrorState());
    }
  }

  Future<void> update(SettingsModel settings) async {
    final SettingsLoadedState currentState = state;
    if (state is SettingsLoadedState) {
      try {
        emit(SettingsLoadedState(settings: currentState.copyWith(settings)));
        await _repository.update(currentState.settings.copyWith(settings));
      } catch (err) {
        emit(SettingsErrorState());
      }
    }
    try {
        emit(SettingsLoadedState(settings: settings));
        await _repository.update(settings);
      } catch (err) {
        emit(SettingsErrorState());
      }
  }

}
