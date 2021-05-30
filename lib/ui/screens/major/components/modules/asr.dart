import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/asr_cubit.dart';
import 'package:sonus/logic/cubit/records_cubit.dart';
import 'package:sonus/logic/cubit/records_groups_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/logic/models/record_group_model.dart';
import 'package:sonus/logic/models/record_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';

class ASR extends StatefulWidget {
  final String selectedLanguage;
  const ASR({
    Key key,
    @required this.selectedLanguage,
  }) : super(key: key);

  @override
  _ASRState createState() => _ASRState();
}

class _ASRState extends State<ASR> {
  final FlutterTts flutterTts = FlutterTts();

  SpeechRecognition _speech = SpeechRecognition();

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  bool isPaused = false;

  String transcription = '';
  List<String> speechRecognized = [];

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
    print(widget.selectedLanguage);
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  Future<String> _displayRecordNameDialog(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0.0,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context).close,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                  TextButton(
                      onPressed: () {
                        if (_textFieldController.text.isNotEmpty) {
                          Navigator.pop(context, _textFieldController.text);
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context).record_save,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                ],
              ),
            ],
            title: Text(AppLocalizations.of(context).record_name),
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).dividerColor),
              child: TextField(
                cursorColor: Theme.of(context).accentColor,
                onChanged: (value) {},
                controller: _textFieldController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline3,
                  hintText: AppLocalizations.of(context).record_name,
                ),
              ),
            ),
          );
        });
  }

  Future<int> _displayGroupChooserDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<RecordsGroupsCubit, RecordsGroupsState>(
              listener: (context, recordsGroupInitialState) {
            if (recordsGroupInitialState is RecordsGroupsLoadedState)
              BlocProvider.of<RecordsGroupsCubit>(context).load();
          }, builder: (context, recordsGroupsState) {
            if (recordsGroupsState is RecordsGroupsLoadedState) {
              return AlertDialog(
                elevation: 0.0,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context).close,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                ],
                title: Text(AppLocalizations.of(context).choose_group),
                content: Container(
                  width: MediaQuery.of(context).size.width / 0.5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: recordsGroupsState.recordsGroups.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context,
                              recordsGroupsState.recordsGroups[index].id);
                        },
                        child: ListTile(
                          title: Text(
                              recordsGroupsState.recordsGroups[index].name),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ),
              );
            }
            return Container();
          });
        });
  }

  void save(BuildContext context) async {
    int groupId = await _displayGroupChooserDialog(context);
    String recordName = await _displayRecordNameDialog(context);

    // if (groupId != null && recordName != null) {
    //   String speechString = speechRecognized.join("|");
    //   await BlocProvider.of<RecordsCubit>(context).add(RecordModel(
    //       value: speechString.trim(), name: recordName, groupId: groupId));
    // }
    print(groupId);
    print(recordName);
  }

  void activateSpeechRecognizer() {
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate(widget.selectedLanguage).then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  void start() => _speech.activate(widget.selectedLanguage).then((_) {
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
                                                kIconSave,
                                                color: Theme.of(context)
                                                    .buttonColor,
                                              ),
                                              onPressed: () {
                                                _speechRecognitionAvailable &&
                                                        !_isListening
                                                    ? save(context)
                                                    : null;
                                                HapticFeedback.heavyImpact();
                                              }),
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
