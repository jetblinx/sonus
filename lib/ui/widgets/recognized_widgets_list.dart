import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonus/ui/widgets/snackbars/snackbar.dart';
import 'package:sonus/utils/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecognizedPhrasesList extends StatefulWidget {
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
  _RecognizedPhrasesListState createState() => _RecognizedPhrasesListState();
}

class _RecognizedPhrasesListState extends State<RecognizedPhrasesList> {
  Container _buildModelBottomSheetMenu(int index, bool archive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  kIconCopy,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppLocalizations.of(context).copy,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            onTap: () {
              Clipboard.setData(new ClipboardData(
                      text: archive
                          ? widget.archiveSpeech[index]
                          : widget.speechRecognized[index]))
                  .then((_) {
                Navigator.pop(context);
                final snackBar = FloatingSnackbar.floatingSnackBar(
                    Icon(
                      kIconCopy,
                      color: Theme.of(context).accentColor,
                    ),
                    AppLocalizations.of(context).phrase_copied,
                    AppLocalizations.of(context).close,
                    context);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(
              children: [
                Icon(
                  kIconDelete,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppLocalizations.of(context).delete,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            onTap: () {
              setState(() => {
                    archive
                        ? widget.archiveSpeech.removeAt(index)
                        : widget.speechRecognized.removeAt(index)
                  });
              
              Navigator.pop(context);
              final snackBar = FloatingSnackbar.floatingSnackBar(
                  Icon(
                    kIconDelete,
                    color: Theme.of(context).accentColor,
                  ),
                  AppLocalizations.of(context).phrase_deleted,
                  AppLocalizations.of(context).close,
                  context);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu(int index, bool archive) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: 180,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: _buildModelBottomSheetMenu(index, archive),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return widget.archiveSpeech == null
        ? ListView.separated(
            controller: widget._scrollController,
            itemCount: widget.speechRecognized.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onLongPress: () {
                  _modalBottomSheetMenu(index, false);
                },
                onTap: () {
                  Clipboard.setData(new ClipboardData(
                          text: widget.speechRecognized[index]))
                      .then((_) {
                    final snackBar = FloatingSnackbar.floatingSnackBar(
                        Icon(
                          kIconCopy,
                          color: Theme.of(context).accentColor,
                        ),
                        AppLocalizations.of(context).phrase_copied,
                        AppLocalizations.of(context).close,
                        context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                title: Text(
                  widget.speechRecognized[index],
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
            itemCount: widget.archiveSpeech.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Clipboard.setData(
                          new ClipboardData(text: widget.archiveSpeech[index]))
                      .then((_) {
                    final snackBar = FloatingSnackbar.floatingSnackBar(
                        Icon(
                          kIconCopy,
                          color: Theme.of(context).accentColor,
                        ),
                        AppLocalizations.of(context).phrase_copied,
                        AppLocalizations.of(context).close,
                        context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                title: Text(
                  widget.archiveSpeech[index],
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
