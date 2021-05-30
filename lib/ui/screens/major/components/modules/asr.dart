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
  final String selectedLanguage;
  const ASR({
    Key key,
    @required this.selectedLanguage,
  }) : super(key: key);

  @override
  _ASRState createState() => _ASRState(selectedLanguage);
}

class _ASRState extends State<ASR> {
  final FlutterTts flutterTts = FlutterTts();

  SpeechRecognition _speech = SpeechRecognition();
  String selectedLang;
  _ASRState(this.selectedLang);

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  bool isPaused = false;

  String transcription = '';
  List<String> speechRecognized = [];

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
    print(selectedLang);
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void setAsrLanguage(newLang) {
    _speech.activate(newLang).then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  void activateSpeechRecognizer() {
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
        return _speech.listen().then((result) {
          setState(() {
            _isListening = result;
          });
          if (result) {
            isPaused = false;
            HapticFeedback.heavyImpact();
          }
          transcription = '';
          speechRecognized.add(transcription);
        });
      });

  void cancel() => {
        _speech.cancel().then((_) => setState(() => {
              _isListening = false,
              isPaused = false,
            })),
      };

  void stop() => _speech.stop().then((_) {
        setState(() => {
              _isListening = false,
              isPaused = true,
            });
        if (transcription.trim() == '') {
          speechRecognized.removeLast();
        }
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    setState(
        () => {transcription = text, speechRecognized.last = transcription});

    _scrollToBottom();
  }

  void onRecognitionComplete(String text) {
    setState(() => {
          _isListening = false,
          isPaused = true,
          speechRecognized.last = text,
          transcription = '',
          if (text.trim() == '') {speechRecognized.removeLast()}
        });
    HapticFeedback.heavyImpact();
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
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                kPaddingScreenPage + kPaddingScreenPageContent),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller: _scrollController,
                                itemCount: speechRecognized.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      speechRecognized[index],
                                      style:
                                          Theme.of(context).textTheme.caption,
                                      textAlign: TextAlign.start,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider();
                                },
                              ),
                            ),
                            Divider(
                              height: 1,
                            ),
                            Center(
                              child: !isPaused
                                  ? Container(
                                      child: IconButton(
                                          iconSize: kSizeButtonEnd,
                                          icon: Icon(
                                            kIconPause,
                                            color:
                                                Theme.of(context).buttonColor,
                                          ),
                                          onPressed: () async {
                                            _isListening
                                                ? {
                                                    await stop(),
                                                    if (speechRecognized
                                                            .length ==
                                                        0)
                                                      {
                                                        BlocProvider.of<
                                                                    AsrCubit>(
                                                                context)
                                                            .changed(),
                                                        cancel(),
                                                      },
                                                  }
                                                : null;
                                          }),
                                    )
                                  : Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              iconSize: kSizeButtonEnd,
                                              icon: Icon(
                                                kIconPlay,
                                                color: Theme.of(context)
                                                    .buttonColor,
                                              ),
                                              onPressed: () {
                                                _speechRecognitionAvailable &&
                                                        !_isListening
                                                    ? start()
                                                    : null;
                                                HapticFeedback.heavyImpact();
                                              }),
                                          IconButton(
                                              iconSize: kSizeButtonEnd,
                                              icon: Icon(
                                                kIconStop,
                                                color: Theme.of(context)
                                                    .buttonColor,
                                              ),
                                              onPressed: () {
                                                _isListening ? cancel() : null;
                                                BlocProvider.of<AsrCubit>(
                                                        context)
                                                    .changed();
                                                speechRecognized.clear();
                                                HapticFeedback.heavyImpact();
                                              }),
                                        ],
                                      ),
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
                                HapticFeedback.heavyImpact();
                                BlocProvider.of<AsrCubit>(context).changed();
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
