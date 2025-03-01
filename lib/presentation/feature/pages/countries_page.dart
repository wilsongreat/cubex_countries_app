import 'package:cubex_countries_app/blocs/bloc/country_bloc.dart';
import 'package:cubex_countries_app/config/app_colors.dart';
import 'package:cubex_countries_app/data/models/countries_model.dart';
import 'package:cubex_countries_app/src/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(CountryInitialFetchEvent());
  }

  List<CountriesResponseModel> _responseModel = [];
  bool isLoading = false;
  CountryState _countryState = CountryInitial();
  void _onSearchChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        _responseModel = [];
      });
      return;
    }

    // Update suggestions
    if (_countryState is CountrySuccess) {

      setState(() {
        _responseModel = (_countryState as CountrySuccess)
            .countriesResponseModel
            .where((country) => country.name!.common!
            .toLowerCase()
            .contains(value.trim().toLowerCase()))
            .toList();
      });
      // for(var data in _responseModel){
      //   print(data.name?.common);
      //
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return BlocConsumer<CountryBloc, CountryState>(listener: (context, state) {
      if (state is CountrySuccess) {
        _responseModel = state.countriesResponseModel;
        _countryState = state;

        setState(() {
          isLoading = false;
        });
      }
      if (state is CountryInitial) {
        setState(() {
          isLoading = true;
        });
      }
      if (state is CountryFailure) {
        setState(() {
          isLoading = false;
        });
      }
    }, builder: (context, snapshot) {
      return Skeletonizer(
        enabled: isLoading,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  onChange: (val) {
                    _onSearchChanged(val);
                  },
                  controller: controller,
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _responseModel.length == 0
                      ? Center(
                          child: TextView(
                          text: "NO AVAILABLE DATA",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kTaupe,
                        ))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: "Countrie(s)",
                              fontSize: 25,
                              color: AppColors.kTaupe,
                              fontWeight: FontWeight.bold,
                            ),
                            ListView.separated(
                              primary: false,
                              padding: EdgeInsets.only(top: 10),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _responseModel.length,
                              itemBuilder: (context, i) {
                                var countryData = _responseModel[i];
                                return CountryListTile(
                                  countryCapital: countryData.capital?[0],
                                  countryName: countryData.name?.common,
                                  lang: countryData.languages?.eng,
                                  countryFlagImg: countryData.flags?.png,
                                  mapUrl: countryData.flags!.png,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Gap(10);
                              },
                            )
                          ],
                        ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
