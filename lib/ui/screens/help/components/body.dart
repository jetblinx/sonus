import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;

  ItemModel({this.expanded: false, this.headerItem, this.discription});
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Widget _buildHelpQuestions(BuildContext context) {
    List<ItemModel> itemData = <ItemModel>[
      ItemModel(
        headerItem: AppLocalizations.of(context).help_stt_not_work,
        discription: AppLocalizations.of(context).help_stt_not_work_solution,
      ),
      ItemModel(
        headerItem: AppLocalizations.of(context).help_tts_not_work,
        discription: AppLocalizations.of(context).help_tts_not_work_solution,
      ),
    ];
    return ListView.separated(
      itemCount: itemData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 0,
          color: Theme.of(context).scaffoldBackgroundColor,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                trailing: SizedBox.shrink(),
          title: Text(
              itemData[index].headerItem,
              style: Theme.of(context).textTheme.headline2,
          ),
          children: [
              ListTile(
                title: Text(
                  itemData[index].discription,
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
          ],
        ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingScreenPageContent),
          child: Divider(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        child: Column(
          children: [
            SizedBox(
              child: Container(),
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
                  AppLocalizations.of(context).help,
                  style: Theme.of(context).textTheme.caption,
                ),
                actions: [],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingAllHorizontal),
          child: _buildHelpQuestions(context),
        ),
      ),
    ]));
  }
}
