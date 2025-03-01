import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomAppButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? voidCallback;
  final bool? withEmoji;
  final double? radius;
  final double? width;
  final double? height;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomAppButton({
    super.key,
    this.title,
    this.color,
    this.withEmoji,
    this.voidCallback,
    this.radius,
    this.textColor,
    this.width,
    this.fontWeight,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  voidCallback,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        height: height  ?? 60,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          color: color ?? AppColors.kTaupe,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        ),
        child: Center(
            child: Text(
              title?.toUpperCase() ?? '  ',
              style: GoogleFonts.lato(
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontSize: fontSize ?? 14),
            )),
      ),
    );
  }
}