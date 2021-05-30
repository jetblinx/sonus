import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sonus/logic/models/language_model.dart';
import 'package:sonus/logic/repositories/languages_repository.dart';

part 'languages_state.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  final LanguagesRepository _repository = LanguagesRepository();
  LanguagesCubit() : super(LanguagesInitialState()) {
    load();
  }

  Future<void> load() async {
    final List<LanguageModel> languages = await _repository.languages;
    emit(LanguagesLoadedState(languages));
  }
}
