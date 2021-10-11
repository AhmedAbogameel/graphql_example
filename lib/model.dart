// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.typename,
    this.countries,
  });

  String? typename;
  List<Country>? countries;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    typename: json["__typename"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.typename,
    this.name,
  });

  String? typename;
  String? name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    typename: json["__typename"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "name": name,
  };
}
