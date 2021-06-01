import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:sonus/logic/cubit/records_cubit.dart';
import 'package:sonus/logic/models/record_model.dart';
import 'package:sonus/ui/widgets/alerts/choose_group.dart';
import 'package:sonus/ui/widgets/alerts/choose_record_name.dart';
import 'package:sonus/ui/widgets/snackbars/snackbar.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'asr_screen_state.dart';

class AsrScreenCubit extends Cubit<AsrState> {
  SpeechRecognition _speech = SpeechRecognition();

  final language;

  AsrScreenCubit(this.language)
      : super(AsrState(
            speechRecognitionAvailable: false,
            isListening: false,
            isPaused: false,
            isAsr: false,
            transcription: '',
            speechRecognized: []));

  _scrollToBottom() {
    state.scrollController.jumpTo(state.scrollController.position.maxScrollExtent);
  }

  // State Logic

  void changePause(bool value) {
    emit(AsrState(isPaused: value));
  }

  void changeListening(bool value) {
    emit(AsrState(isListening: value));
  }

  void printBools() {
    print("asr");
    print(state.isAsr);
    print("isListening");
    print(state.isListening);
    print("isPaused");
    print(state.isPaused);
  }

  void changeAsr(bool value) {
    printBools();
  }

  // ASR Logic

  void activateSpeechRecognizer(language) {
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate(language).then((res) {
      emit(AsrState(speechRecognitionAvailable: res));
    });
  }

  void start(language) => _speech.activate(language).then((_) {
        return _speech.listen().then((result) {
          print("ASR State in cubit");
          print(state.isAsr);
          emit(AsrState(isListening: result));
          // emit(AsrState(isAsr: true));

          if (result) {
            emit(AsrState(isPaused: false));
            HapticFeedback.heavyImpact();
          }
          emit(AsrState(transcription: ''));
          //state.speechRecognized.add(state.transcription);
        });
      });

  void cancel() => {
        _speech
            .cancel()
            .then((_) => {emit(AsrState(isListening: false, isPaused: false))})
      };

  void stop() => _speech.stop().then((_) {
        emit(AsrState(isListening: false, isPaused: true));

        if (state.transcription.trim() == '') {
          state.speechRecognized.removeLast();
        }
      });

  void onSpeechAvailability(bool result) => {
        emit(AsrState(speechRecognitionAvailable: result)),
        if (result == false) {emit(AsrState(isPaused: true))}
      };

  void onRecognitionStarted() {
    emit(AsrState(isListening: true));
  }

  void onRecognitionResult(String text) {
    emit(AsrState(transcription: text));
    state.speechRecognized.last = state.transcription;
    _scrollToBottom();
  }

  void onRecognitionComplete(String text) {
    emit(AsrState(isListening: false, isPaused: true, transcription: ""));
    state.speechRecognized.last = text;
    if (text.trim() == '') {
      state.speechRecognized.removeLast();
    }
    if (state.speechRecognized.length == 0) {
      emit(AsrState(isAsr: false));
    }
    HapticFeedback.heavyImpact();
  }

  void errorHandler() => activateSpeechRecognizer(language);

  // SAVE Logic

  Future<String> _displayRecordNameDialog(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    return chooseRecordName(context, _textFieldController);
  }

  Future<int> _displayGroupChooserDialog(BuildContext context) async {
    return chooseGroup(context);
  }

  void save(BuildContext context) async {
    int groupId = await _displayGroupChooserDialog(context);
    String recordName;
    if (groupId != null) recordName = await _displayRecordNameDialog(context);

    if (groupId != null && recordName != null) {
      String speechString = state.speechRecognized.join("|");
      await BlocProvider.of<RecordsCubit>(context).add(RecordModel(
          name: recordName, value: speechString.trim(), groupId: groupId));
      final snackBar = FloatingSnackbar.floatingSnackBar(
          Icon(
            kIconAdd,
            color: Theme.of(context).accentColor,
          ),
          AppLocalizations.of(context).record_added,
          AppLocalizations.of(context).close,
          context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
