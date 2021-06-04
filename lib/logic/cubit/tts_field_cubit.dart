import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tts_field_state.dart';

class TtsFieldCubit extends Cubit<String> {
  TtsFieldCubit() : super("");

  void update(String value) {
    emit(value.trim());
  }

  void clear() {
    emit("");
  }
}
