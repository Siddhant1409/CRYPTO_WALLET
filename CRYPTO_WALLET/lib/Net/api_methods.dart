// https://api.coingecko.com/api/v3/coins

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import 'dart:convert';

Future<double> getPrice(String id) async {
  try {
    var url = "https://api.coingecko.com/api/v3/coins/ " + id;
    var response = await http.get(url);
    var json = jsonDecode(response.body); // formatting in json format;
    var value = json['market_dat']['current_price']['usd'].toString();
    return double.parse(value);
  } catch (e) {
    print(e.toString());
    return 0.0;
  }
}
//Do study parseing;