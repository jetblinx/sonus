import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/logic/repositories/phases_repository.dart';
import 'package:sonus/utils/logger.dart';

part 'phrases_state.dart';

class PhrasesCubit extends Cubit<PhrasesState> {
  final PhrasesRepository _repository = PhrasesRepository();
  PhrasesCubit() : super(PhrasesInitialState()) {
    load();
  }

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
    emit(PhrasesInitialState());
    await _repository.add(phrase);
    load();
  }

  Future<void> update(PhraseModel phrase) async {
    emit(PhrasesInitialState());
    await _repository.update(phrase);
    load();
  }
  Future<void> delete(int id) async {
    emit(PhrasesInitialState());
    await _repository.delete(id);
    load();
  } 
}
