import 'package:intl/intl.dart';

String formatDate(DateTime dateNow, {bool withTimes = false, bool onlyTimes = false}) {
  String date = "yyyy/dd/hh";
  if (dateNow != null) {
    date = DateFormat("dd/MM/yyyy").format(dateNow);
    if (withTimes && onlyTimes == false) {
      date = DateFormat("dd MMMM yyyy HH:mm:ss").format(dateNow);
    } else if (onlyTimes) {
      date = DateFormat("HH:mm:ss").format(dateNow);
    }
  }
  return date;
}