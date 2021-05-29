import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sonus/ui/screens/notes/group/group.dart';
import 'package:sonus/ui/widgets/TextFields/text_input_field.dart';
import 'package:sonus/utils/constants.dart';
import 'package:sonus/utils/icons.dart';
import 'package:sonus/utils/size_config.dart';

class Body extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  
  final List groups = [
    'Default',
    'Friends',
    'School',
    'Food',
    'SchoolSchoolSchool',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  child: Container(
                    //color: Theme.of(context).backgroundColor,
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
                      AppLocalizations.of(context).note_groups,
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
              padding: EdgeInsets.symmetric(
                  horizontal: kPaddingScreenPage + kPaddingScreenPageContent),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 4 / 2,
                  ),
                  itemCount: groups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      customBorder: CircleBorder(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.background,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(kPaddingGroupContainer),
                          child: Center(
                            child: Text(
                              groups[index],
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, GroupView.routeName);
                      },
                    );
                  }),
            ),
          ),
          Container(
            child: TextInputField(
              icon: Icon(
                kIconAdd,
                color: Theme.of(context).accentColor,
              ),
              isBorder: true,
            ),
          )
        ],
      ),
    );
  }
}
