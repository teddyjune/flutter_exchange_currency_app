import 'package:exchange_currency_app/exchange_rate_api.dart';
import 'package:flutter/material.dart';

class ExchangeViewModel extends ChangeNotifier {
  final _exchangeRateApi = ExchangeRateApi();
  Map<String, dynamic> conversionRates = {};
  List<String> shownList = [];
  List<dynamic> valueList = [];

  Future fetchConversionRates(String query) async {
    conversionRates = await _exchangeRateApi.getConversionRates(query);
    shownList = conversionRates.keys.toList();
    valueList = conversionRates.values.toList();
    notifyListeners();
  }
}
