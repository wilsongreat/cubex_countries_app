import 'package:cubex_countries_app/services/api_service.dart';
import 'package:http/http.dart' as http;

class CountryService extends ApiCall {

  Future<http.Response> fetchCountries() {
    final response =  getReq(fetchCountriesUri);
    return response;
  }

}