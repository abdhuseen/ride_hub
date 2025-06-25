class FilterModel {
  String? selectedMonth;
  String? selectedYear;
  double minPrice;
  double maxPrice;
  double minRate;
  double maxRate;

  FilterModel({
    this.selectedMonth,
    this.selectedYear,
    this.minPrice = 95,
    this.maxPrice = 330,
    this.minRate = 2,
    this.maxRate = 4,
  });

  void clearAll() {

    selectedMonth = null;
    selectedYear = null;
    minPrice = 95;
    maxPrice = 330;
    minRate = 2;
    maxRate = 4;
  }
}

class Brand {
  final String name;
  final String logoPath;
  bool isSelected;

  Brand({
    required this.name,
    required this.logoPath,
    this.isSelected = false,
  });
}
