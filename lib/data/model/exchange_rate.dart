class ExchangeRate {
  final Map<String, dynamic> conversionRates;

  ExchangeRate({required this.conversionRates});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      conversionRates: json['conversion_rates'] as Map<String, dynamic>,
    );
  }
}
