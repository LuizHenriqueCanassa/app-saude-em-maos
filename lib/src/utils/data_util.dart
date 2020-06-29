import 'package:intl/intl.dart';

class DataUtil{
  static String formatData(String date) {
    if(date == null){
      return "N/A";
    }
    
    DateTime dateTime = DateTime.parse(date);
    var formatter = new DateFormat("dd/MM/yyyy");

    return formatter.format(dateTime);
  }
}