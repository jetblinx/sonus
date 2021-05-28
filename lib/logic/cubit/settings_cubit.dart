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
    //   if (state is SettingsLoadedState) {
    //     emit(SettingsPrevState(state: state));
    //   } else {
    //     emit(SettingsInitialState());
    //   }
      final settings = await _repository.settings;
      Logger.log(settings.toString());
      emit(SettingsLoadedState(settings));
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(SettingsModel settings) async {
    final SettingsLoadedState currentState = state;
    Logger.log(settings.toString());
    emit(SettingsInitialState());
    emit(currentState.copyWith(settings));
    await _repository.update(currentState.settings.copyWith(settings));
    // load();s
  }
}
