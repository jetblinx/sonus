part of 'languages_cubit.dart';

abstract class LanguagesState extends Equatable {
  const LanguagesState();

  @override
  List<Object> get props => [];
}

class LanguagesInitialState extends LanguagesState {}

class LanguagesLoadedState extends LanguagesState {
  final List<LanguageModel> languages;

  LanguagesLoadedState(this.languages);
}
