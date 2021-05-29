import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/asr_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/logger.dart';

class ASR extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  final bool asrOn = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoadedState) {
          if (Converter.intToBool(state.settings.speechRecognition)) {
            return BlocProvider(
              create: (context) => AsrCubit(),
              child: BlocBuilder<AsrCubit, bool>(
                builder: (context, isAsr) {
                  if (isAsr) {
                    return Column(
                      children: [
                        Container(
                          child: Text("Some text"),
                        ),
                        Center(
                          child: SingleChildScrollView(
                            child: Container(
                              child: IconButton(
                                iconSize: kSizeButtonEnd,
                                icon: Icon(
                                  kIconEnd,
                                  color: Theme.of(context).buttonColor,
                                ),
                                onPressed: () {
                                  BlocProvider.of<AsrCubit>(context).changed();
                                  HapticFeedback.heavyImpact();
                                }
                              ),
                            )
                          ),
                        ),
                      ],
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
                                BlocProvider.of<AsrCubit>(context).changed();
                                HapticFeedback.heavyImpact();
                              }
                            ),
                          )
                        ),
                      ),
                    );
                  }
                }
              )
            );
          }
          return Container();
        }
        return Container();
      },
    );
  }
}
