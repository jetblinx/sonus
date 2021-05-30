import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/asr_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';

// class ASR extends StatelessWidget {
//   final FlutterTts flutterTts = FlutterTts();

//   final bool asrOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SettingsCubit, SettingsState>(
//       builder: (context, state) {
//         if (state is SettingsLoadedState) {
//           if (Converter.intToBool(state.settings.speechRecognition)) {
//             return BlocProvider(
//               create: (context) => AsrCubit(),
//               child: BlocBuilder<AsrCubit, bool>(
//                 builder: (context, isAsr) {
//                   if (isAsr) {
//                     return Column(
//                       children: [
//                         Container(
//                           child: Text("Some text"),
//                         ),
//                         Center(
//                           child: SingleChildScrollView(
//                             child: Container(
//                               child: IconButton(
//                                 iconSize: kSizeButtonEnd,
//                                 icon: Icon(
//                                   kIconEnd,
//                                   color: Theme.of(context).buttonColor,
//                                 ),
//                                 onPressed: () {
//                                   BlocProvider.of<AsrCubit>(context).changed();
//                                   HapticFeedback.heavyImpact();
//                                 }
//                               ),
//                             )
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Expanded(
//                       child: Center(
//                         child: SingleChildScrollView(
//                           child: Container(
//                             child: IconButton(
//                               iconSize: kSizeButtonMic,
//                               icon: Icon(
//                                 kIconMic,
//                                 color: Theme.of(context).buttonColor,
//                               ),
//                               onPressed: () {
//                                 BlocProvider.of<AsrCubit>(context).changed();
//                                 HapticFeedback.heavyImpact();
//                               }
//                             ),
//                           )
//                         ),
//                       ),
//                     );
//                   }
//                 }
//               )
//             );
//           }
//           return Container();
//         }
//         return Container();
//       },
//     );
//   }
// }

class ASR extends StatefulWidget {
  @override
  _ASRState createState() => _ASRState();
}

class _ASRState extends State<ASR> {
  final FlutterTts flutterTts = FlutterTts();

  SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  String transcription = '';
  String selectedLang = "ru_RU";

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  void activateSpeechRecognizer() {
    print("Activating Speech");
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate(selectedLang).then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  void start() => _speech.activate(selectedLang).then((_) {
        print("Listening Speech");
        return _speech.listen().then((result) {
          setState(() {
            _isListening = result;
          });
        });
      });

  void cancel() => {
        _speech.cancel().then((_) => setState(() => _isListening = false)),
      };

  void stop() => _speech.stop().then((_) {
        setState(() => _isListening = false);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    setState(() => transcription = text);
  }

  void onRecognitionComplete(String text) {
    setState(() => _isListening = false);
    print("Completed.");
  }

  void errorHandler() => activateSpeechRecognizer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoadedState) {
          if (Converter.intToBool(state.settings.speechRecognition)) {
            return BlocProvider(
                create: (context) => AsrCubit(),
                child: BlocBuilder<AsrCubit, bool>(builder: (context, isAsr) {
                  if (isAsr) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(transcription, style: Theme.of(context).textTheme.caption,),
                              ),
                            ),
                            Center(
                              child: Container(
                                child: IconButton(
                                    iconSize: kSizeButtonEnd,
                                    icon: Icon(
                                      kIconEnd,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                    onPressed: () {
                                      _isListening ? stop() : null;
                                      BlocProvider.of<AsrCubit>(context)
                                          .changed();
                                      HapticFeedback.heavyImpact();
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                            child: Container(
                          child: IconButton(
                              iconSize: kSizeButtonMic,
                              icon: Icon(
                                kIconMic,
                                color: Theme.of(context).buttonColor,
                              ),
                              onPressed: () {
                                _speechRecognitionAvailable && !_isListening
                                    ? start()
                                    : null;
                                BlocProvider.of<AsrCubit>(context).changed();
                                HapticFeedback.heavyImpact();
                              }),
                        )),
                      ),
                    );
                  }
                }));
          }
          return Container();
        }
        return Container();
      },
    );
  }
}
