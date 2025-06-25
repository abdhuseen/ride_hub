import 'package:flutter/material.dart';

import '../model/filter_model.dart';


class FilterController extends ChangeNotifier {
  FilterModel _filter = FilterModel();

  FilterModel get filter => _filter;

  final List<Brand> _brands = [
    Brand(name: 'Porsche', logoPath: 'test_images/porsche_logo.png'),
    Brand(name: 'BMW', logoPath: 'test_images/bmw_logo.png'),
    Brand(name: 'Renault', logoPath: 'test_images/renault_logo.png'),
    Brand(name: 'Mercedes', logoPath: 'test_images/mercedes_logo.png'),
  ];

  List<Brand> get brands => _brands;

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final List<String> years = [
    '2024', '2023', '2022', '2021', '2020', '2019', '2018'
  ];

  void toggleBrand(String brandName) {
    for (var brand in _brands) {
      if (brand.name == brandName) {
        brand.isSelected = !brand.isSelected;
        break;
      }
    }
    notifyListeners();
  }

  void setMonth(String? month) {
    _filter.selectedMonth = month;
    notifyListeners();
  }

  void setYear(String? year) {
    _filter.selectedYear = year;
    notifyListeners();
  }

  void setPriceRange(double min, double max) {
    _filter.minPrice = min;
    _filter.maxPrice = max;
    notifyListeners();
  }

  void setRateRange(double min, double max) {
    _filter.minRate = min;
    _filter.maxRate = max;
    notifyListeners();
  }
  void clearAll() {
    for (var brand in _brands) {
      brand.isSelected = false;
    }
    _filter.clearAll();
    notifyListeners();
  }




  int getResultCount() {

    return 24;
  }
}
