import 'package:exchange_currency_app/data/repository/exchange_rate_repository.dart';
import 'package:flutter/material.dart';

class ExchangeViewModel extends ChangeNotifier {
  final _repository = ExchangeRateRepository();
  Map<String, dynamic> conversionRates = {};
  List<String> shownList = [];
  List<dynamic> valueList = [];
  bool isLoading = false;

  Future fetchConversionRates(String query) async {
    isLoading = true;
    notifyListeners();

    conversionRates = await _repository.getConversionRates(query);
    shownList = conversionRates.keys.toList();
    valueList = conversionRates.values.toList();
    isLoading = false;
    notifyListeners();
  }
}
