import 'dart:convert';

class CountryDetailsResponseModel {
  final Name name;
  final List<String>? tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, Currency> currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final List<String> languages;
  // final Map<String, Translation> translations;
  final List<double> latlng;
  final bool landlocked;
  final List<String> borders;
  final double area;
  final Demonyms demonyms;
  final String flag;
  final Maps maps;
  final int population;
  final Map<String, double> gini;
  final String fifa;
  // final Car car;
  final List<String> timezones;
  final List<String> continents;
  final Flag flags;
  // final CoatOfArms coatOfArms;
  final String startOfWeek;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  CountryDetailsResponseModel({
    required this.name,
    this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    // required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    // required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    // required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory CountryDetailsResponseModel.fromJson(Map<String, dynamic> json) => CountryDetailsResponseModel(
    name: Name.fromJson(json['name']),
    tld: json['tld'] != null ? List<String>.from(json['tld']) : null,
    cca2: json['cca2'],
    ccn3: json['ccn3'],
    cca3: json['cca3'],
    cioc: json['cioc'],
    independent: json['independent'],
    status: json['status'],
    unMember: json['unMember'],
    currencies: (json['currencies'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, Currency.fromJson(value))),
    idd: Idd.fromJson(json['idd']),
    capital: List<String>.from(json['capital']),
    altSpellings: List<String>.from(json['altSpellings']),
    region: json['region'],
    subregion: json['subregion'],
    languages: (json['languages'] as Map<String, dynamic>?)?.values.map((lang) => lang.toString()).toList() ?? [],
    // translations: (json['translations'] as Map<String, dynamic>).map(
    //         (key, value) => MapEntry(key, Translation.fromJson(value))),
    latlng: List<double>.from(json['latlng'].map((x) => x.toDouble())),
    landlocked: json['landlocked'],
    borders: List<String>.from(json['borders']),
    area: json['area'].toDouble(),
    demonyms: Demonyms.fromJson(json['demonyms']),
    flag: json['flag'],
    maps: Maps.fromJson(json['maps']),
    population: json['population'],
    gini: (json['gini'] as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value.toDouble())),
    fifa: json['fifa'],
    // car: Car.fromJson(json['car']),
    timezones: List<String>.from(json['timezones']),
    continents: List<String>.from(json['continents']),
    flags: Flag.fromJson(json['flags']),
    // coatOfArms: CoatOfArms.fromJson(json['coatOfArms']),
    startOfWeek: json['startOfWeek'],
    capitalInfo: CapitalInfo.fromJson(json['capitalInfo']),
    postalCode: PostalCode.fromJson(json['postalCode']),
  );
}

class Name {
  final String common;
  final String official;

  Name({required this.common, required this.official});

  factory Name.fromJson(Map<String, dynamic> json) =>
      Name(common: json['common'], official: json['official']);
}

class Currency {
  final String name;
  final String symbol;

  Currency({required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      Currency(name: json['name'], symbol: json['symbol']);
}

class Idd {
  final String root;
  final List<String> suffixes;

  Idd({required this.root, required this.suffixes});

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
      root: json['root'], suffixes: List<String>.from(json['suffixes']));
}

class Demonyms {
  final Demonym eng;
  final Demonym fra;

  Demonyms({required this.eng, required this.fra});

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
      eng: Demonym.fromJson(json['eng']), fra: Demonym.fromJson(json['fra']));
}

class Demonym {
  final String f;
  final String m;

  Demonym({required this.f, required this.m});

  factory Demonym.fromJson(Map<String, dynamic> json) =>
      Demonym(f: json['f'], m: json['m']);
}

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
      googleMaps: json['googleMaps'], openStreetMaps: json['openStreetMaps']);
}

class Flag {
  final String png;
  final String svg;
  final String alt;

  Flag({required this.png, required this.svg, required this.alt});

  factory Flag.fromJson(Map<String, dynamic> json) =>
      Flag(png: json['png'], svg: json['svg'], alt: json['alt']);
}

class CapitalInfo {
  final List<double> latlng;

  CapitalInfo({required this.latlng});

  factory CapitalInfo.fromJson(Map<String, dynamic> json) =>
      CapitalInfo(latlng: List<double>.from(json['latlng']));
}

class PostalCode {
  final String format;
  final String regex;

  PostalCode({required this.format, required this.regex});

  factory PostalCode.fromJson(Map<String, dynamic> json) =>
      PostalCode(format: json['format'], regex: json['regex']);
}
