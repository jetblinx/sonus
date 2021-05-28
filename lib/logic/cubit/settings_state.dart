part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitialState extends SettingsState {}

class SettingsCurrentState extends SettingsState {
  final SettingsModel settings;
  SettingsCurrentState(this.settings);

  SettingsCurrentState copyWith(SettingsModel settings) {
    return SettingsCurrentState(SettingsModel(
      id: settings.id ?? this.settings,
      language: settings.language ?? this.settings.language,
      theme: settings.theme != null ? settings.theme : this.settings.theme,
      speechRecognition: settings.speechRecognition != null ? settings.speechRecognition : this.settings.speechRecognition,
      textToSpeech: settings.textToSpeech != null ? settings.textToSpeech : this.settings.textToSpeech
    ));
  }
}

class SettingsPrevState extends SettingsState {
  SettingsModel settings;
  final SettingsCurrentState state;
  SettingsPrevState({this.settings, this.state})  {
    if (state != null) {
      settings = state.settings;
    }
  }
}

class SettingsErrorState extends SettingsState {}