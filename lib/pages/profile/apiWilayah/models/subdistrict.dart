import 'dart:convert';

Subdistrict subdistrictFromJson(String str) =>
    Subdistrict.fromJson(json.decode(str));

String subdistrictToJson(Subdistrict data) => json.encode(data.toJson());

class Subdistrict {
  String id;
  String idKabupaten;
  String name;

  Subdistrict({
    required this.id,
    required this.idKabupaten,
    required this.name,
  });

  factory Subdistrict.fromJson(Map<String, dynamic> json) => Subdistrict(
        id: json["id"],
        idKabupaten: json["id_kabupaten"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kabupaten": idKabupaten,
        "name": name,
      };

  ///this method will prevent the override of toString
  String userAsString() {
    return '${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(Subdistrict model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}
