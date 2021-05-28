part of 'phrases_cubit.dart';

abstract class PhrasesState extends Equatable {
  const PhrasesState();

  @override
  List<Object> get props => [];
}

class PhrasesInitialState extends PhrasesState {}

class PhrasesLoadedState extends PhrasesState {
  final List<PhraseModel> phrases;
  PhrasesLoadedState(this.phrases);

  void copyWith(PhraseModel phrase) {
    this.phrases.add(phrase);
  }
}
