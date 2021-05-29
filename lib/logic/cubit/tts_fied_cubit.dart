import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tts_fied_state.dart';

class TtsFiedCubit extends Cubit<String> {
  TtsFiedCubit() : super(null);

  void update(String value) {
    emit(value);
  }

  void clear() {
    emit(null);
  }
}
