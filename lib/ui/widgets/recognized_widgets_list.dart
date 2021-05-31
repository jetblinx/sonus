import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonus/ui/widgets/snackbars/snackbar.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecognizedPhrasesList extends StatelessWidget {
  const RecognizedPhrasesList({
    Key key,
    ScrollController scrollController,
    this.speechRecognized,
    this.archiveSpeech,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final List<String> speechRecognized;
  final List<String> archiveSpeech;

  @override
  Widget build(BuildContext context) {
    return archiveSpeech == null
        ? ListView.separated(
            controller: _scrollController,
            itemCount: speechRecognized.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Clipboard.setData(
                          new ClipboardData(text: speechRecognized[index]))
                      .then((_) {
                    final snackBar = FloatingSnackbar.floatingSnackBar(
                        Icon(
                          kIconCopy,
                          color: Theme.of(context).accentColor,
                        ),
                        AppLocalizations.of(context).record_added,
                        AppLocalizations.of(context).close,
                        context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                title: Text(
                  speechRecognized[index],
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.start,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          )
        : ListView.separated(
            itemCount: archiveSpeech.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Clipboard.setData(
                          new ClipboardData(text: archiveSpeech[index]))
                      .then((_) {
                    final snackBar = FloatingSnackbar.floatingSnackBar(
                        Icon(
                          kIconCopy,
                          color: Theme.of(context).accentColor,
                        ),
                        AppLocalizations.of(context).record_added,
                        AppLocalizations.of(context).close,
                        context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                title: Text(
                  archiveSpeech[index],
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.start,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
  }
}
