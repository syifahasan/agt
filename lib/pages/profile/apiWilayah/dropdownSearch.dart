import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:authentic_guards/pages/profile/apiWilayah/models/province.dart';
import 'package:authentic_guards/pages/profile/apiWilayah/models/city.dart';
import 'package:authentic_guards/pages/profile/apiWilayah/models/subdistrict.dart';
import 'package:authentic_guards/pages/profile/apiWilayah/models/village.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:http/http.dart' as http;

const String ApiKey =
    "077b5c0540a3689bc7e2b868671e488fc47708e184f65e03609fc046f9c40977";

class DropdownAddress extends StatefulWidget {
  const DropdownAddress({super.key});

  @override
  State<DropdownAddress> createState() => _DropdownAddressState();
}

class _DropdownAddressState extends State<DropdownAddress> {
  String? idProv;
  String? idKab;
  String? idKec;
  final String ApiKey =
      "077b5c0540a3689bc7e2b868671e488fc47708e184f65e03609fc046f9c40977";

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: w * 0.02, right: w * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: w * 0.04,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: w * 0.02),
            child: DropdownSearch<Province>(
              popupProps: PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              itemAsString: (Province u) => u.userAsString(),
              onChanged: (value) => idProv = value?.id,
              dropdownBuilder: (context, selectedItem) => Text(
                  selectedItem?.name ?? "Pilih Provinsi",
                  style: TextStyle(fontSize: w * 0.04)),
              asyncItems: (text) async {
                var res = await http.get(
                  Uri.parse(
                      "https://api.binderbyte.com/wilayah/provinsi?api_key=$ApiKey"),
                );
                if (res.statusCode != 200) {
                  return [];
                }
                List allProvince =
                    (json.decode(res.body) as Map<String, dynamic>)["value"];
                List<Province> allModelProvince = [];

                allProvince.forEach(
                  (element) {
                    allModelProvince.add(
                      Province(
                        id: element["id"],
                        name: element["name"],
                      ),
                    );
                  },
                );
                return allModelProvince;
              },
            ),
          ),
          SizedBox(
            height: w * 0.02,
          ),
          Container(
            child: DropdownSearch<City>(
              popupProps: PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              itemAsString: (City u) => u.userAsString(),
              onChanged: (value) => idKab = value?.id,
              dropdownBuilder: (context, selectedItem) => Text(
                  selectedItem?.name ?? "Pilih Kabupaten/Kota",
                  style: TextStyle(fontSize: w * 0.04)),
              asyncItems: (text) async {
                var res = await http.get(
                  Uri.parse(
                      "https://api.binderbyte.com/wilayah/kabupaten?api_key=$ApiKey&id_provinsi=$idProv"),
                );
                if (res.statusCode != 200) {
                  return [];
                }
                List allCity =
                    (json.decode(res.body) as Map<String, dynamic>)["value"];
                List<City> allModelCity = [];

                allCity.forEach((element) {
                  allModelCity.add(
                    City(
                      id: element["id"],
                      name: element["name"],
                      idProvinsi: element["id_provinsi"],
                    ),
                  );
                });
                return allModelCity;
              },
            ),
          ),
          SizedBox(
            height: w * 0.02,
          ),
          Container(
            child: DropdownSearch<Subdistrict>(
              popupProps: PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              itemAsString: (Subdistrict u) => u.userAsString(),
              onChanged: (value) => idKec = value?.id,
              dropdownBuilder: (context, selectedItem) => Text(
                  selectedItem?.name ?? "Pilih Kecamatan",
                  style: TextStyle(fontSize: w * 0.04)),
              asyncItems: (text) async {
                var res = await http.get(
                  Uri.parse(
                      "https://api.binderbyte.com/wilayah/kecamatan?api_key=$ApiKey&id_kabupaten=$idKab"),
                );
                if (res.statusCode != 200) {
                  return [];
                }
                List allKec =
                    (json.decode(res.body) as Map<String, dynamic>)["value"];
                List<Subdistrict> allModelKec = [];

                allKec.forEach((element) {
                  allModelKec.add(
                    Subdistrict(
                        id: element["id"],
                        name: element["name"],
                        idKabupaten: element["id_kabupaten"]),
                  );
                });
                return allModelKec;
              },
            ),
          ),
          SizedBox(
            height: w * 0.02,
          ),
          Container(
            child: DropdownSearch<Village>(
              popupProps: PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              itemAsString: (Village u) => u.userAsString(),
              onChanged: (value) => print(value?.toJson()),
              dropdownBuilder: (context, selectedItem) => Text(
                  selectedItem?.name ?? "Pilih Desa",
                  style: TextStyle(fontSize: w * 0.04)),
              asyncItems: (text) async {
                var res = await http.get(
                  Uri.parse(
                      "https://api.binderbyte.com/wilayah/kelurahan?api_key=$ApiKey&id_kecamatan=$idKec"),
                );
                if (res.statusCode != 200) {
                  return [];
                }
                List allVillage =
                    (json.decode(res.body) as Map<String, dynamic>)["value"];
                List<Village> allModelVillage = [];

                allVillage.forEach((element) {
                  allModelVillage.add(
                    Village(
                        id: element["id"],
                        name: element["name"],
                        idKecamatan: element["id_kecamatan"]),
                  );
                });
                return allModelVillage;
              },
            ),
          ),
        ],
      ),
    );
  }
}
