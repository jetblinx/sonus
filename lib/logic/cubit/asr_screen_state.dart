part of 'asr_screen_cubit.dart';

class AsrState {
  final bool speechRecognitionAvailable;
  final bool isListening;
  final bool isPaused;

  final bool isAsr;
  
  final String transcription;
  final List<String> speechRecognized;
  ScrollController scrollController = ScrollController();

  AsrState({
    this.speechRecognitionAvailable,
    this.isListening,
    this.isPaused,
    this.isAsr,
    this.transcription,
    this.speechRecognized
  });
}
