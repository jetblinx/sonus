import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/logic/repositories/phases_repository.dart';
import 'package:sonus/utils/logger.dart';

part 'phrases_state.dart';

class PhrasesCubit extends Cubit<PhrasesState> {
  final PhrasesRepository _repository = PhrasesRepository();
  PhrasesCubit() : super(PhrasesInitialState());

  Future<void> load() async {
    try {
      final List<PhraseModel> phrases = await _repository.phrases;
      Logger.log(phrases.toString());
      emit(PhrasesLoadedState(phrases));
    } catch (_) {
      print(_);
    }
  }

  Future<void> add(PhraseModel phrase) async {
    final PhrasesLoadedState currentState = state;
    emit(PhrasesInitialState());
    currentState.copyWith(phrase);
    emit(currentState);
    await _repository.add(phrase);
  }

    Future<void> update(PhraseModel phrase) async {
    await _repository.update(phrase);
    load();
  }
}
