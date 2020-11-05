import 'package:intl/intl.dart';

/// Formats a DateTime [value] object.
fmtDateTime(DateTime value) => DateFormat('dd MMMM y').format(value);
