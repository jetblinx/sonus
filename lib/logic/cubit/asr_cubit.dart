import 'package:bloc/bloc.dart';

class AsrCubit extends Cubit<bool> {
  AsrCubit() : super(false);

  void changed() {
    emit(!state);
  }
}
