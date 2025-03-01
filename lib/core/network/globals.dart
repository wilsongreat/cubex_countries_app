abstract class Globals{
  final String scheme = 'https';
  final String host = 'restcountries.com';
  final String param = 'region/africa?status=true&fields=name,languages,capital,flags';

  final String v3 = 'v3.1';


  Uri get fetchCountriesUri => Uri(
      scheme: scheme,
      host: host,
      path: '$v3/region/africa', // Fixed path
      queryParameters: {
        "status": "true",
        "fields": "name,languages,capital,flags"
      }
  );
  Uri fetchCountryDetailsUri(String name) => Uri(
      scheme: scheme,
      host: host,
      path: '$v3/name/$name', // Fixed path

  );

}