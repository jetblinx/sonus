part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsLoadedState extends SettingsState {
  final SettingsModel settings;

  SettingsLoadedState({this.settings});

  SettingsModel copyWith(SettingsModel settings) {
    return SettingsModel(
      id: settings.id ?? this.settings.id,
      language: settings.language ?? this.settings.language,
      theme: settings.theme ?? this.settings.theme,
      speechRecognition: settings.speechRecognition ?? this.settings.speechRecognition,
      speechToText: settings.speechToText ?? this.settings.speechToText
    );
  }
}

class SettingsInitialState extends SettingsState {}
class SettingsErrorState extends SettingsState {}