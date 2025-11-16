import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String get toFormattedDate {
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(this);
  }

  String get viewMonth {
    DateFormat formatter = DateFormat("MMM");
    return formatter.format(this);
  }

  String get toFormattedTime {
    return DateFormat('h:mm a').format(this);
  }
}
