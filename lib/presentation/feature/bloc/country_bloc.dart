import 'dart:async';
import 'dart:convert';
import 'package:cubex_countries_app/data/models/countries_model.dart';
import 'package:cubex_countries_app/data/models/country_details_model.dart';
import 'package:cubex_countries_app/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    on<CountryInitialFetchEvent>(countryInitialFetchEvent);
    on<CountryDetailEvent>(fetchCountryDetails);
  }

  final api = ApiCall();
  final log = getLogger("Fetch Countries");

   List<CountriesResponseModel> countries=[];

FutureOr<void> countryInitialFetchEvent(CountryInitialFetchEvent event ,Emitter<CountryState> emit)async{
  emit(CountryInitial());
  try{
    final response = await api.getReq(api.fetchCountriesUri);
    final decodedResponse = jsonDecode(response.body) as List;
    countries= decodedResponse.map((e) =>CountriesResponseModel.fromJson(e)).toList();
    emit(CountrySuccess(countries));
  }catch( e,s){
    emit(CountryFailure());
    log.e(e.toString());
    log.e(s.toString());
  }finally{

  }
}

  List<CountryDetailsResponseModel> countryDetails = [];
FutureOr<void> fetchCountryDetails(CountryDetailEvent event ,Emitter<CountryState> emit)async{
  emit(CountryDetailsInitial());
  try{
    final response = await api.getReq(api.fetchCountryDetailsUri(event.countryName));
    final decodedResponse = jsonDecode(response.body) as List;
    decodedResponse.map((e) =>CountryDetailsResponseModel.fromJson(e)).toList();
    countryDetails = decodedResponse.map((e) =>CountryDetailsResponseModel.fromJson(e)).toList();
    emit(CountryDetailsSuccess(countryDetails));
    log.i("RESPONSEEEEE:$countryDetails");
  }catch( e,s){
    emit(CountryDetailsFailure());
    log.e(e.toString());
    log.e(s.toString());
  }finally{

  }
}

}

