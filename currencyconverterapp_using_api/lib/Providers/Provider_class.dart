import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Provider_class with ChangeNotifier {
  bool isloading = true;
  Map mapresp = {};
  Map<String, dynamic> _maprates = {};

  String get error => error;
  Map<String, dynamic> get maprates => _maprates;

  get value => null;

  getapidata() async {
    const url = 'https://open.er-api.com/v6/latest/USD';
    final uri = Uri.parse(url);
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      mapresp = jsonDecode(resp.body);
      _maprates = mapresp['rates'];

      print("WA=>$maprates");
    }
    isloading = false;
    notifyListeners();
  }
}
