part of 'phrases_cubit.dart';

abstract class PhrasesState extends Equatable {
  const PhrasesState();

  @override
  List<Object> get props => [];
}

class PhrasesInitial extends PhrasesState {}

class PhrasesLoaded extends PhrasesState {
  final List<PhraseModel> phrases;
  PhrasesLoaded(this.phrases);

  void copyWith(PhraseModel phrase) {
    this.phrases.add(phrase);
  }
}
