part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitialState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final SettingsModel settings;
  SettingsLoadedState(this.settings);

  SettingsLoadedState copyWith(SettingsModel settings) {
    Logger.log(settings.toString());
    return SettingsLoadedState(SettingsModel(
      id: settings.id ?? this.settings,
      language: settings.language ?? this.settings.language,
      theme: settings.theme != null ? settings.theme : this.settings.theme,
      speechRecognition: settings.speechRecognition != null ? settings.speechRecognition : this.settings.speechRecognition,
      quickTts: settings.quickTts != null ? settings.quickTts : this.settings.quickTts,
      textToSpeech: settings.textToSpeech != null ? settings.textToSpeech : this.settings.textToSpeech,
      languageCode: settings.languageCode ?? this.settings.languageCode,
      localeCode: settings.localeCode ?? this.settings.localeCode,
      onboardingShown: settings.onboardingShown ?? this.settings.onboardingShown
    ));
  }
}

// class SettingsPrevState extends SettingsState {
//   SettingsModel settings;
//   final SettingsLoadedState state;
//   SettingsPrevState({this.settings, this.state})  {
//     if (state != null) {
//       settings = state.settings;
//     }
//   }
// }

class SettingsErrorState extends SettingsState {}