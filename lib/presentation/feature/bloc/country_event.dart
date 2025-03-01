part of 'country_bloc.dart';

abstract class CountryEvent {}

class CountryInitialFetchEvent extends CountryEvent{}
class CountryDetailEvent extends CountryEvent{
  String countryName;
   CountryDetailEvent(this.countryName);
}
