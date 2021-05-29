import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/logic/cubit/phrases_cubit.dart';
import 'package:sonus/logic/models/phrase_model.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final PhraseModel phrase;

  const Body({Key key, this.phrase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = phrase != null ? phrase.value : "";
    return Container(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPage),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                AppBar(
                  iconTheme: IconThemeData(
                    color: Theme.of(context).accentColor,
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(kIconDelete),
                      onPressed: () {
                        if (phrase != null) {
                          BlocProvider.of<PhrasesCubit>(context).delete(phrase.id);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                  title: Text(phrase != null ?
                    AppLocalizations.of(context).edit_phrase
                    : AppLocalizations.of(context).add_phrase,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0.0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
            child: Center(
              child: TextInputField(
                initialValue: text,
                maxLines: null,
                backgroundTransaprent: true,
                centerAlign: true,
                onChanged: (String value) {
                  text = value;
                },
              ),
            )
          )
        ),
        Container(
          child: IconButton(
            icon: Icon(
              kIconComplete,
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () {
              if (text != null || text != "") {
                if (phrase != null) BlocProvider.of<PhrasesCubit>(context).update(phrase.copyWith(value: text));
                else BlocProvider.of<PhrasesCubit>(context).add(PhraseModel(value: text));
                Navigator.pop(context);
              }
            },
            iconSize: kSizeButtonComplete,
          ),
        ),
      ]),
    );
  }
}
