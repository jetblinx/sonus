import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sonus/logic/cubit/asr_cubit.dart';
import 'package:sonus/logic/cubit/settings_cubit.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/converter.dart';
import 'package:sonus/utils/icons.dart';

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
              child: BlocBuilder<AsrCubit, AsrState>(
              builder: (context, state) {
                return Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                        child: state.isAsr
                            ? Text("Some text")
                            : Container(
                              child: IconButton(
                                iconSize: kSizeButtonMic,
                                icon: Icon(
                                  kIconMic,
                                  color: Theme.of(context).buttonColor,
                                ),
                                // splashColor: Colors.transparent,
                                // highlightColor: Colors.transparent,
                                onPressed: () => {
                                  BlocProvider.of<AsrCubit>(context).changed(),
                                  HapticFeedback.heavyImpact()
                                }
                                ),
                            )
                    ),
                  ),
                );
              },
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
