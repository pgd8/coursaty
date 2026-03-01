import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DrawerItem extends StatefulWidget {
  final String title;
  final String icon;
  const DrawerItem({super.key, required this.icon, required this.title});

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        if (widget.title == LocaleKeys.kMyCourses.tr()) {
          context.push(Routes.kMyCourses);
        }
        if (widget.title == LocaleKeys.kChangeLanguage.tr()) {
          if (context.locale == const Locale('en')) {
            context.setLocale(const Locale('ar'));
          } else {
            context.setLocale(const Locale('en'));
            setState(() {});
          }
        }
      },
      child: Row(
        children: [
          SvgPicture.asset(widget.icon, height: 15.h, width: 15.w),
          SizedBox(width: 10.w),
          Text(widget.title, style: Styles.textStyleGray700R14),
        ],
      ),
    );
  }
}
