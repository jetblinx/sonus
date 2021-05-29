import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/phrases_cubit.dart';
import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/ui/screens/quick_phrases/editing/quick_phrase_editing.dart';
import 'package:sonus/ui/widgets/chips/chips_builder.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {

  final List chips = [
    "Hi",
    "Hello",
    "How are you? fdgdf gdfgdfgfdgf gfgfg fgfgfgffgh ffgfgfgfhghfg fgfg",
    "What's up?",
    "Go home",
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
    "Hi",
    "Hello",
    "How are you?",
    "What's up?",
    "Go home",
  ];

  final String language = "ru-RU";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhrasesCubit, PhrasesState>(
      listener: (context, phrasesState) {
        if (phrasesState is PhrasesInitialState) BlocProvider.of<PhrasesCubit>(context).load();
      },
      builder: (context, phrasesState) {
        if (phrasesState is PhrasesLoadedState) {
          if (phrasesState.phrases.isEmpty) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Container(
                          ),
                          height: getProportionateScreenHeight(10),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
                          child: AppBar(
                            iconTheme: IconThemeData(
                              color: Theme.of(context).accentColor,
                            ),
                            centerTitle: true,
                            title: Text(
                              AppLocalizations.of(context).editing_phrases,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
                      child: Container(child: Center(child: Text(AppLocalizations.of(context).no_phrases)))
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, QuickPhraseEditing.routeName);
                      }, 
                      icon: Icon(kIconAdd, color: Theme.of(context).accentColor)
                    ),
                  ),
                  SizedBox(
                    child: Container(
                    ),
                    height: getProportionateScreenHeight(15),
                  )
                ],
              ),
            );
          }
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Container(
                        ),
                        height: getProportionateScreenHeight(10),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
                        child: AppBar(
                          iconTheme: IconThemeData(
                            color: Theme.of(context).accentColor,
                          ),
                          centerTitle: true,
                          title: Text(
                            AppLocalizations.of(context).editing_phrases,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                      ),
                    
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
                    child: Stack(children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            ChipBuilder(
                              phrases: phrasesState.phrases,
                              onPress: "open",
                              onPressed: (PhraseModel phrase) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> QuickPhraseEditing(phrase: phrase)));
                              },
                              language: language,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, QuickPhraseEditing.routeName);
                    }, 
                    icon: Icon(kIconAdd, color: Theme.of(context).accentColor)
                  ),
                ),
              ],
            ),
          );
        }
        return Container(child: Center(child: Text(AppLocalizations.of(context).no_phrases)));
      },
    );
  }
}
