import 'dart:convert';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  String id;
  String name;

  Province({
    required this.id,
    required this.name,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  ///this method will prevent the override of toString
  String userAsString() {
    return '${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(Province model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}
