import 'package:intl/intl.dart';


/// Formats a double [value] object in the currency format.
String getCurrency() => NumberFormat.simpleCurrency(locale: 'pt_BR').currencySymbol;

/// Formats a double [value] object in the currency format.
String  fmtMoney(double value) => NumberFormat.simpleCurrency(locale: 'pt_BR').format(value);
