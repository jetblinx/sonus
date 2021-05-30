import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonus/logic/cubit/languages_cubit.dart';
import 'package:sonus/logic/cubit/phrases_cubit.dart';
import 'package:sonus/ui/screens/major/components/modules/tts.dart';
import 'package:sonus/ui/screens/quick_phrases/view/quick_phrases_view.dart';
import 'package:sonus/ui/screens/records_groups/view/records_groups_view.dart';
import 'package:sonus/ui/screens/settings/settings.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

import 'modules/asr.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(
                      kIconBookmark,
                      color: Theme.of(context).buttonColor,
                    ),
                    onPressed: () => Navigator.pushNamed(
                        context, QuickPhrasesView.routeName)),
                IconButton(
                    icon: Icon(
                      kIconFolder,
                      color: Theme.of(context).buttonColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, RecordsGroupsView.routeName)),
                IconButton(
                    icon: Icon(
                      kIconSettings,
                      color: Theme.of(context).buttonColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, Settings.routeName)),
              ],
            ),
          ),
          BlocProvider.value(
              value: BlocProvider.of<PhrasesCubit>(context),
              child: BlocBuilder<LanguagesCubit, LanguagesState>(
                  builder: (context, languagesState) {
                if (languagesState is LanguagesLoadedState) {
                  return Container(
                    child: ASR(
                      selectedLanguage: languagesState.languages
                          .firstWhere((element) =>
                              element.languageCode ==
                              Localizations.localeOf(context).languageCode)
                          .languageCode,
                    ),
                  );
                }
                return Container();
              })),
          Container(
            child: BlocProvider.value(
                value: BlocProvider.of<PhrasesCubit>(context), child: TTS()),
          ),
        ],
      ),
    );
  }
}
