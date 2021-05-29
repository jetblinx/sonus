import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tts_fied_state.dart';

class TtsFiedCubit extends Cubit<String> {
  TtsFiedCubit() : super("");

  void update(String value) {
    emit(value.trim());
  }

  void clear() {
    emit("");
  }
}
