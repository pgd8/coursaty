import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(
          title: 'Notifications',
          isHome: false,
        ),
      ),
      body: Center(
        child: Text('No Notifications Yet',style: Styles.textStyleGray800M15,),
      ),
    );
  }
}
