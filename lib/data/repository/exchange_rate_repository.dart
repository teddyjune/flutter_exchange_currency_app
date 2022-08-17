import 'package:exchange_currency_app/data/data_source/exchange_rate_api.dart';

class ExchangeRateRepository {
  final _api = ExchangeRateApi();

  Future<Map<String, dynamic>> getConversionRates(String query) async {
    return await _api.getConversionRates(query);
  }
}
