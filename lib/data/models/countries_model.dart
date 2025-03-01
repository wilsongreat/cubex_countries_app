class CountriesResponseModel {
  final Flags? flags;
  final Name? name;
  final List<String>? capital;
  final Languages? languages;

  CountriesResponseModel({this.flags, this.name, this.capital, this.languages});

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CountriesResponseModel(
      flags: json['flags'] != null ? Flags.fromJson(json['flags']) : null,
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
      capital: json['capital'] != null ? List<String>.from(json['capital']) : null,
      languages: json['languages'] != null ? Languages.fromJson(json['languages']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flags': flags?.toJson(),
      'name': name?.toJson(),
      'capital': capital,
      'languages': languages?.toJson(),
    };
  }

  CountriesResponseModel copyWith({
    Flags? flags,
    Name? name,
    List<String>? capital,
    Languages? languages,
  }) {
    return CountriesResponseModel(
      flags: flags ?? this.flags,
      name: name ?? this.name,
      capital: capital ?? this.capital,
      languages: languages ?? this.languages,
    );
  }
}

class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({this.png, this.svg, this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json['png'],
      svg: json['svg'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }
}

class Name {
  final String? common;
  final String? official;
  final NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
      official: json['official'],
      nativeName: json['nativeName'] != null ? NativeName.fromJson(json['nativeName']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'common': common,
      'official': official,
      'nativeName': nativeName?.toJson(),
    };
  }
}

class NativeName {
  final Eng? eng;
  final Eng? sot;

  NativeName({this.eng, this.sot});

  factory NativeName.fromJson(Map<String, dynamic> json) {
    return NativeName(
      eng: json['eng'] != null ? Eng.fromJson(json['eng']) : null,
      sot: json['sot'] != null ? Eng.fromJson(json['sot']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eng': eng?.toJson(),
      'sot': sot?.toJson(),
    };
  }
}

class Eng {
  final String? official;
  final String? common;

  Eng({this.official, this.common});

  factory Eng.fromJson(Map<String, dynamic> json) {
    return Eng(
      official: json['official'],
      common: json['common'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'official': official,
      'common': common,
    };
  }
}

class Languages {
  final String? eng;
  final String? sot;

  Languages({this.eng, this.sot});

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      eng: json['eng'],
      sot: json['sot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eng': eng,
      'sot': sot,
    };
  }
}
