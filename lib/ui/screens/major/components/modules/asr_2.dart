import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/asr_screen_cubit.dart';
import 'package:sonus/logic/cubit/connection_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/widgets/recognized_widgets_list.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoadedState) {
          if (Converter.intToBool(state.settings.speechRecognition)) {
            return BlocProvider(
              create: (context) => NetConnectionCubit(),
              child: BlocBuilder<NetConnectionCubit, bool>(
                  builder: (context, isConnected) {
                if (isConnected) {
                  return BlocProvider(
                      create: (context) =>
                          AsrScreenCubit(widget.selectedLanguage),
                      child: BlocBuilder<AsrScreenCubit, AsrState>(
                          builder: (context, asrState) {
                        if (asrState is AsrState) {
                          print("ASR State");
                          print(asrState.isAsr);
                          if (asrState.isAsr) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kPaddingScreenPage +
                                        kPaddingScreenPageContent),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: RecognizedPhrasesList(
                                          scrollController:
                                              asrState.scrollController,
                                          speechRecognized:
                                              asrState.speechRecognized),
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    Center(
                                      child: !asrState.isPaused
                                          ? Container(
                                              child: IconButton(
                                                  iconSize: kSizeButtonEnd,
                                                  icon: Icon(
                                                    kIconPause,
                                                    color: Theme.of(context)
                                                        .buttonColor,
                                                  ),
                                                  onPressed: () async {
                                                    asrState.isListening
                                                        ? {
                                                            BlocProvider
                                                                    .of<AsrScreenCubit>(
                                                                        context)
                                                                .stop(),
                                                            if (asrState
                                                                    .speechRecognized
                                                                    .length ==
                                                                0)
                                                              {
                                                                BlocProvider.of<
                                                                            AsrScreenCubit>(
                                                                        context)
                                                                    .changeAsr(
                                                                        false),
                                                                BlocProvider.of<
                                                                            AsrScreenCubit>(
                                                                        context)
                                                                    .cancel(),
                                                              },
                                                          }
                                                        : null;
                                                  }),
                                            )
                                          : Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      iconSize: kSizeButtonEnd,
                                                      icon: Icon(
                                                        kIconSave,
                                                        color: Theme.of(context).buttonColor,
                                                      ),
                                                      onPressed: () {
                                                        !asrState.isListening
                                                            ? BlocProvider.of<AsrScreenCubit>(context).save(context)
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
                                                        asrState.speechRecognitionAvailable &&
                                                                !asrState.isListening
                                                            ? BlocProvider.of<AsrScreenCubit>(context).start(widget.selectedLanguage)
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
                                                        asrState.isListening
                                                            ? BlocProvider.of<AsrScreenCubit>(context).cancel()
                                                            : null;
                                                        BlocProvider.of<AsrScreenCubit>(context).changeAsr(false);
                                                        asrState.speechRecognized.clear();
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
                                      onPressed: () async {
                                        BlocProvider.of<AsrScreenCubit>(context).printBools();
                                        BlocProvider.of<AsrScreenCubit>(context).changeAsr(true);
                                        
                                        BlocProvider.of<AsrScreenCubit>(context).start(widget.selectedLanguage);
                                        HapticFeedback.heavyImpact();
                                        print("------------");
                                        BlocProvider.of<AsrScreenCubit>(context).printBools();
                                      }),
                                )),
                              ),
                            );
                          }
                        }
                        return Container();
                      }));
                }
                return Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(children: [
                          Icon(
                            kIconDisconnected,
                            color: Theme.of(context).accentColor,
                            size: kSizeButtonMic,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context).no_internet_connection,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return Container();
        }
        return Container();
      },
    );
  }
}
