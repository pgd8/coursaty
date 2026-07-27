import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DrawerItem extends StatefulWidget {
  final String title;
  final String icon;
  final void Function()? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap
  });

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  widget.onTap ?? () {
        context.pop();
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
