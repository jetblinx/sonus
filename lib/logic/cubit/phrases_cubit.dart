import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/logic/repositories/phases_repository.dart';

part 'phrases_state.dart';

class PhrasesCubit extends Cubit<PhrasesState> {
  final PhrasesRepository _repository = PhrasesRepository();
  PhrasesCubit() : super(PhrasesInitial());

  Future<void> load() async {
    try {
      final List<PhraseModel> phrases = await _repository.phrases;
      emit(PhrasesLoaded(phrases));
    } catch (_) {
      print(_);
    }
  }

  Future<void> add(PhraseModel phrase) async {
    final PhrasesLoaded currentState = state;
    currentState.copyWith(phrase);
    emit(currentState);
    await _repository.add(phrase);
  }

    Future<void> update(PhraseModel phrase) async {
    await _repository.update(phrase);
    load();
  }
}
