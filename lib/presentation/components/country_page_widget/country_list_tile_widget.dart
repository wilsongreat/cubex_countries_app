import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:cubex_countries_app/presentation/feature/pages/country_details.dart';
import 'package:cubex_countries_app/src/components.dart';
import 'package:cubex_countries_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CountryListTile extends StatelessWidget {
  final String? countryName;
  final String? countryCapital;
  final String? countryFlagImg;
  final String? lang;
  final String? mapUrl;
  const CountryListTile({super.key, this.countryName, this.countryCapital,  this.countryFlagImg,  this.lang, this.mapUrl});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CountryDetailsPage(name: countryName!,mapUrl: mapUrl!,)));
      },
      child: Container(
        height: fullHeight(context) * .1,
        width: fullWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.kTaupe)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: AppColors.kTaupe,
                  image: DecorationImage(image: NetworkImage(countryFlagImg ?? "https://flagcdn.com/w320/ma.png"),fit: BoxFit.cover)
              ),
            ),
            Gap(10),
            SizedBox(
              width: fullWidth(context) *.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: countryName ??"country Name", fontSize: 18,color: AppColors.kTaupe,textOverflow: TextOverflow.ellipsis,),
                  TextView(text: countryCapital ?? "country capital", fontSize: 16,color: AppColors.kTaupe,textOverflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                  color: AppColors.kBg,
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: TextView(text: lang ?? "lang",fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.kTaupe,),
            )

          ],
        ),
      ),
    );
  }
}