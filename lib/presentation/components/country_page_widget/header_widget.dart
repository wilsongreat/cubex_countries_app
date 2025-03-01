import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:cubex_countries_app/src/components.dart';
import 'package:cubex_countries_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override

  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return  Container(
      height: fullHeight(context) * .3,
      width: fullWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        color: AppColors.kBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(40),
          TextView(text: "Hi Max 👋🏻,",fontSize: 30,fontWeight: FontWeight.w500,color: AppColors.kTaupe,),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: [
                TextSpan(text: "feel free to check out your \ndesired ",style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight:  FontWeight.w400,
                  color: AppColors.kTaupe,

                )),
                TextSpan(text: " country.",style: GoogleFonts.dancingScript(
                    fontSize: 45,
                    fontWeight:  FontWeight.bold,
                    color: AppColors.kTaupe,
                    height: 0.8
                )),
              ],
            ),
          ),
          SearchInput(controller: controller),
        ],
      ),
    );
  }
}