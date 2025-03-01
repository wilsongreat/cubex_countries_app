part of 'country_bloc.dart';

abstract class CountryState {}

/// country init

final class CountryInitial extends CountryState {}



final class CountrySuccess extends CountryState {
  final List<CountriesResponseModel> countriesResponseModel;
  CountrySuccess(this.countriesResponseModel);
}

final class CountryFailure extends CountryState {}


/// country details


final class CountryDetailsInitial extends CountryState {}



final class CountryDetailsSuccess extends CountryState {
  final List<CountryDetailsResponseModel> countriesDetailsResponseModel;
  CountryDetailsSuccess(this.countriesDetailsResponseModel);
}

final class CountryDetailsFailure extends CountryState {}
