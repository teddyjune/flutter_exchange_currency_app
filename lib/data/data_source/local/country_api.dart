import 'dart:convert';

import 'package:exchange_currency_app/data/data_source/local/currency_code.dart';
import 'package:exchange_currency_app/data/model/country.dart';

class CountryApi {
  Future<List<Country>> getNationalName() async {
    await Future.delayed(const Duration(seconds: 1));
    String jsonString = data; //currencyCodeJson.dart

    Iterable json = jsonDecode(jsonString);
    return json.map((e) => Country.fromJson(e)).toList();
  }
}
