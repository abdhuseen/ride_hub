import 'package:flutter/cupertino.dart';

class DropDownMenuButtonController extends ChangeNotifier {
  String? month;
  String? year;

  List<String> months = List.generate(12, (index) {
    return index < 9 ? "0${index + 1}" : "${index + 1}";
  });

  List<String> years = List.generate((DateTime.now().year - 2020) + 1, (index) {
    return "${2020 + index}";
  });

  void setMonth(String? month) {
    this.month = month;
    notifyListeners();
  }

  void setYear(String? year) {
    this.year = year;
    notifyListeners();
  }

  void reset() {
    month = null;
    year = null;
    notifyListeners();
  }
}
