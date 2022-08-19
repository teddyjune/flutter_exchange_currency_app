import 'package:exchange_currency_app/data/model/exchange_rate.dart';
import 'package:exchange_currency_app/data/repository/exchange_rate_repository.dart';
import 'package:flutter/material.dart';

class ExchangeViewModel extends ChangeNotifier {
  final _repository = ExchangeRateRepository();
  List<ExchangeRate> _exchangeRates = [];

  List<ExchangeRate> get exchangeRates => List.unmodifiable(_exchangeRates);
  bool isLoading = false;

  Future fetchConversionRates(String query) async {
    isLoading = true;
    notifyListeners();

    void onSearch(String query) async {
      _exchangeRates = await _repository.getExchangeRateList(query);
      isLoading = false;
      notifyListeners();
    }
  }
}
