import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class MainButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final bool? arrowIcon;
  final bool? isOutlined;
  final Color? borderColor;
  final Color? iconColor;
  final Widget? customContent;
  final bool isDisabled;
  final String? prefixIcon;

  const MainButtonCustom({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.arrowIcon = false,
    this.isOutlined = false,
    this.borderColor,
    this.iconColor,
    this.customContent,
    this.isDisabled = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.h,
      child: (isOutlined ?? false)
          ? OutlinedButton(
        onPressed: isDisabled ? null : onTap,
        style: OutlinedButton.styleFrom(
          padding: customContent != null ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 4.w),
          side: BorderSide(
            color: isDisabled ? ColorData.gray200Color : (borderColor ?? ColorData.primary500Color),
            width: 1.5,
          ),
          backgroundColor: isDisabled ? ColorData.gray50Color : (color ?? ColorData.whiteColor),
          foregroundColor: isDisabled ? ColorData.gray400Color : (textColor ?? ColorData.primary500Color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),

        child: (customContent != null)
            ? customContent!
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) SvgPicture.asset(prefixIcon!, height: 20.w) else const SizedBox(),
            Expanded(
              child: Text(
                text,
                style: isDisabled
                    ? Styles.textStyleGray400R14
                    : Styles.textStylePrimary500R14.copyWith(
                  color: textColor ?? ColorData.primary500Color,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (arrowIcon ?? false) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: isDisabled ? ColorData.gray300Color : (iconColor ?? ColorData.primary500Color),
                size: 20.w,
              ),
            ],
          ],
        ),
      )
          : ElevatedButton(
        onPressed: isDisabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          backgroundColor: isDisabled ? ColorData.gray200Color : (color ?? ColorData.primary500Color),
          foregroundColor: isDisabled ? ColorData.gray500Color : (textColor ?? ColorData.whiteColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: isDisabled ? 0 : 2,
          shadowColor: isDisabled ? Colors.transparent : null,
        ),
        child: (customContent != null)
            ? customContent!
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                style: isDisabled
                    ? Styles.textStyleGray500R14
                    : Styles.textStyleWhiteM16.copyWith(
                  color: textColor ?? ColorData.whiteColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (arrowIcon ?? false) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: isDisabled ? ColorData.gray400Color : (iconColor ?? ColorData.whiteColor),
                size: 20.w,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
