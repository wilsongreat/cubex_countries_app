import 'package:cubex_countries_app/blocs/bloc/country_bloc.dart';
import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:cubex_countries_app/data/models/country_details_model.dart';
import 'package:cubex_countries_app/presentation/components/shared/custom_btn.dart';
import 'package:cubex_countries_app/src/components.dart';

import 'package:cubex_countries_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryDetailsPage extends StatefulWidget {
  final String name;
  final String mapUrl;
  const CountryDetailsPage({super.key, required this.name, required this.mapUrl});

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CountryBloc>().add(CountryDetailEvent(widget.name));
  }
   List<CountryDetailsResponseModel>? _responseModel;
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    final String mapUrl = "https://goo.gl/maps/H8gJi5mL4Cmd1SF28";

    Future<void> openMap() async {
      if (await canLaunchUrl(Uri.parse(mapUrl))) {
        await launchUrl(Uri.parse(mapUrl), mode: LaunchMode.externalApplication);
      } else {
        throw "Could not launch $mapUrl";
      }
    }
    return BlocConsumer<CountryBloc,CountryState>(
      listener: (context, state) {
        if (state is CountryDetailsSuccess){
          _responseModel = state.countriesDetailsResponseModel;
          setState(() {
            isLoading=false;
          });
        }
        if (state is CountryDetailsInitial){
          setState(() {
            isLoading=true;
          });
        }
        if(state is CountryDetailsFailure){
          setState(() {
            isLoading=false;
          });
        }
      },
      builder: (context, snapshot) {

        final countryData = _responseModel?[0];
        return Skeletonizer(
          enabled: isLoading,
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlagHeader(flagImg: countryData?.flags.png?? ''),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          detailsWidget(
                            title: "Country Name",
                            subtext: countryData?.name.common
                          ),
                          detailsWidget(
                              title: "Country Capital",
                              subtext: countryData?.capital[0],
                          ),

                        ],
                      ),

                      Gap(10),
                      TextView(
                        text: "Languages",
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kTaupe,
                      ),
                      Gap(10),


                      if (countryData?.languages ==null ) TextView(text: "No Data") else SizedBox(
                        height: 25,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                            itemBuilder: (ctx,i){
                          final lang = countryData.languages[i];
                          return langWidget(lang);
                        }, separatorBuilder: (context,i){
                           return Gap(10);
                        }, itemCount: countryData!.languages.length),
                      ),

                      Gap(20),
                      TextView(
                        text: "Flag Origin:",
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kTaupe,
                      ),
                      Gap(10),
                      TextView(
                          text:countryData?.flags.alt ?? "NO DATA AVAILABLE",
                              // "The flag of Lesotho is composed of three horizontal bands of blue, white and green in the ratio of 3:4:3. A black mokorotlo — a Basotho hat — is centered in the white band.",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kTaupe),
                      Gap(10),
                    ],
                  ),
                ),
                Spacer(),
                Align(alignment: Alignment.center,
                  child: CustomAppButton(
                    voidCallback: openMap,
                    width: fullWidth(context) * .7,
                    title: "view on Map",
                  ),
                ),
                Gap(30)
              ],
            ),
          ),
        );
      }
    );
  }

  Widget detailsWidget({title,subtext}){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextView(
          text: title ?? 'Country Name',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.kTaupe,
        ),
        TextView(
            text: subtext ?? 'Country capital',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.kTaupe),
      ],
    );
  }

  Widget langWidget(lang){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.kBg,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: TextView(
        text: lang?? "english",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.kTaupe,
      ),
    );
  }
}



