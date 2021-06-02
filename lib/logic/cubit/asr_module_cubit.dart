import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'asr_module_state.dart';

class AsrModuleCubit extends Cubit<AsrModuleState> {
  AsrModuleCubit() : super(AsrModuleState(isAsr: false, isPermission: true)) {
    checkMicPermission();
  }

  void checkMicPermission() async {
    bool micPermission =  await Permission.microphone.request().isGranted;
    emit(AsrModuleState(isAsr: state.isAsr, isPermission: micPermission));
  }

  void changeAsr() {
    emit(AsrModuleState(isAsr: !state.isAsr, isPermission: state.isPermission));
  }
}
