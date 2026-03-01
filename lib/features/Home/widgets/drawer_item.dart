import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  const DrawerItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        if (title == 'My Courses') {
          context.push(Routes.kMyCourses);
        }
      },
      child: Row(
        children: [
          SvgPicture.asset(icon, height: 15.h, width: 15.w),
          SizedBox(width: 10.w),
          Text(title, style: Styles.textStyleGray700R14),
        ],
      ),
    );
  }
}
