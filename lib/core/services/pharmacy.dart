import 'dart:convert';
import 'dart:io';

import 'package:eczaneistanbul/models/pharmacy.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<List> getPharmacies(
  bool isReverse,
) async {
  var values = [];
  final response = await http.get(
      Uri.parse('https://openapi.izmir.bel.tr/api/ibb/eczaneler'));
  if (response.statusCode == HttpStatus.ok) {
    final pharmacy = jsonDecode(response.body);
    for (var i = 0; i < pharmacy.length; i++) {
      values.add(Pharmacy(
        pharmacy.elementAt(i)['Tarih'],
        pharmacy.elementAt(i)['LokasyonY'],
        pharmacy.elementAt(i)['LokasyonX'],
        pharmacy.elementAt(i)['Adi'],
        pharmacy.elementAt(i)['Telefon'],
        pharmacy.elementAt(i)['Adres'],
        int.parse(pharmacy.elementAt(i)['BolgeId'].toString()),
        pharmacy.elementAt(i)['Bolge'],
        int.parse(pharmacy.elementAt(i)['EczaneId'].toString()),
        int.parse(pharmacy.elementAt(i)['IlceId'].toString()),
      ));
    }
    await Future.delayed(Duration(seconds: 1));
  }
  if (isReverse) {
    values = values.reversed.toList();
    // eqListSearch = eqListSearch.reversed.toList();
  }
  return values;
}
