enum CurrencyCovertor {
  usd,
  pounds,
  euro,
  yen
}

extension CurrencyCovertorExtension on CurrencyCovertor {

  String? get name {
    switch (this) {
      case CurrencyCovertor.usd:
        return 'usd';
      case CurrencyCovertor.euro:
        return 'euro';
      case CurrencyCovertor.pounds:
        return 'pounds';
      case CurrencyCovertor.yen:
        return 'yen';
      default:
        return null;
    }
  }

  void talk() {
    print('meow');
  }
}