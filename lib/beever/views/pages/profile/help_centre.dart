import 'package:flutter/material.dart';
import 'package:junkbee_user/beever/widgets/profile/helpCentre_widget.dart';

class HelpCentre extends StatefulWidget {
  const HelpCentre({Key? key}) : super(key: key);

  @override
  HelpCentreState createState() => HelpCentreState();
}

class HelpCentreState extends State<HelpCentre> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(260),
          child: HelpCentreWidget(),
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                searchBar(context),
                Topics(context),
                RecentActivity(context),
                MoreHelp(context),
                MailUS(context)
              ],
            ),
          ),
        ));
    // return ScreenUtilInit(
    //     designSize: const Size(480, 904),
    //     builder: (_) =>
    //         );
  }
}
