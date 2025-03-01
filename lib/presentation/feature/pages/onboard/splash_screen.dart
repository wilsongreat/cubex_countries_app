import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:cubex_countries_app/data/app_assets.dart';
import 'package:cubex_countries_app/presentation/components/shared/custom_text.dart';
import 'package:cubex_countries_app/presentation/feature/pages/countries_page.dart';
import 'package:cubex_countries_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (context, animation, secondaryAnimation) => CountriesPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: CountriesPage(),
            );
          },
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBg,
        body: Stack(
          children: [
            Positioned(
                bottom: 40,
                child: Center(
                    child: Image.asset(
                      AppAsset.mapImg,
                      height: 600,
                      width: fullWidth(context),
                      fit: BoxFit.cover,
                      color: AppColors.kTaupe,
                    ))),
            Center(
                child: TextView(text: "CUBex", fontSize: 30,fontWeight: FontWeight.w700,color: AppColors.kTaupe,)).animate()
                .fadeIn(
              begin: 0.1,
              duration: 2000.ms,
              curve: Curves.easeInOut,
            )
                .then()
                .scaleXY(
              begin: 1.0,
              duration: 1500.ms,
              curve: Curves.easeInOut,
            )
          ],
        ));
  }
}
