import 'package:exchange_currency_app/data/data_source/local/country_api.dart';
import 'package:exchange_currency_app/data/data_source/remote/exchange_rate_api.dart';
import 'package:exchange_currency_app/data/model/country.dart';
import 'package:exchange_currency_app/data/model/exchange_rate.dart';

class ExchangeRateRepository {
  final _countryApi = CountryApi();
  final _exchangeApi = ExchangeRateApi();

  Future<List<ExchangeRate>> getExchangeRateList(String query) async {
    final conversionRates = await _exchangeApi.getConversionRates(query);
    final countries = await _countryApi.getNationalName();
    return countries.map((Country country) {
      final conversionRate = conversionRates[country.currencyCode];
      //화면에 나오는 정보 순서로 만듦. (국기/나라이름/통화명/환율)
      return ExchangeRate(
        imageUrl: country.imageUrl,
        countryName: country.country,
        currency: country.currencyCode,
        conversionRate: conversionRate,
      );
    }).toList();
  }
}
