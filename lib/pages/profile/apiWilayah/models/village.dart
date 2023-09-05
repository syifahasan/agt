import 'dart:convert';

Village villageFromJson(String str) => Village.fromJson(json.decode(str));

String villageToJson(Village data) => json.encode(data.toJson());

class Village {
  String id;
  String idKecamatan;
  String name;

  Village({
    required this.id,
    required this.idKecamatan,
    required this.name,
  });

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        id: json["id"],
        idKecamatan: json["id_kecamatan"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kecamatan": idKecamatan,
        "name": name,
      };

  ///this method will prevent the override of toString
  String userAsString() {
    return '${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(Village model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}
