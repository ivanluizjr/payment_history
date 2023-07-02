import 'package:intl/intl.dart';

class CurrencyVO {
  final double value;

  String get valueAsCurrentCurrency {
    final currencyFormated =
        NumberFormat.simpleCurrency(locale: 'pt_BR').format(value);
    return currencyFormated;
  }

  const CurrencyVO(this.value);

  @override
  String toString() {
    return valueAsCurrentCurrency;
  }
}
