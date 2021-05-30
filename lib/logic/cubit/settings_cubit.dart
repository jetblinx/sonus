import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/settings_model.dart';
import 'package:sonus/logic/repositories/settings_repository.dart';
import 'package:sonus/utils/logger.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _repository = SettingsRepository();

  SettingsCubit() : super(SettingsInitialState()) {
    load();
  }

  Future<void> load() async {
    try {
      final settings = await _repository.settings;
      emit(SettingsLoadedState(settings));
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(SettingsModel settings) async {
    final SettingsLoadedState currentState = state;
    emit(SettingsInitialState());
    Logger.log(currentState.copyWith(settings).settings.toString());
    emit(currentState.copyWith(settings));
    await _repository.update(currentState.settings.copyWith(settings));
  }
}
