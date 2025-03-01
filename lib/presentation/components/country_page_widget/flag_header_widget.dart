import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:cubex_countries_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class FlagHeader extends StatelessWidget {
  final String? flagImg;
  const FlagHeader({super.key, required this.flagImg});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: fullHeight(context) * .4,
      width: fullWidth(context),
      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: DecorationImage(
              image: NetworkImage(flagImg!),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headerBtn(
                  action: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_outlined),
              headerBtn(
                  action: () {
                    Navigator.pop;
                  },
                  icon: Icons.question_mark),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerBtn({action, IconData? icon}) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kWhite.withValues(alpha: .3),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}