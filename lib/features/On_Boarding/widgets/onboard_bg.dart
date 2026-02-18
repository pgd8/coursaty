import 'package:coursaty/Core/Themes/unit.dart';
import 'package:flutter/material.dart';


class OnboardBg extends StatelessWidget {
  String image;
  OnboardBg({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      width:Unit(context).getWidthSize* 0.6,
      height: Unit(context).getHeightSize *0.4,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
