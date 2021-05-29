import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'asr_state.dart';

class AsrCubit extends Cubit<AsrState> {
  AsrCubit() : super(AsrState());

  void changed() {
    emit(AsrState(isAsr: !state.isAsr));
  }
}
