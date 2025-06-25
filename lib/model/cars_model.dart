class CarsModel {
  final String id;
  final String brand;
  final String imagePath;
  final int count;

  CarsModel({
    required this.id,
    required this.brand,
    required this.imagePath,
    required this.count,
  });
}

class CarDetail {
  final String id;
  final String name;
  final String brand;
  final String imagePath;
  final int year;
  final String price;

  CarDetail({
    required this.id,
    required this.name,
    required this.brand,
    required this.imagePath,
    required this.year,
    required this.price,
  });
}

class CarSection {
  final String title;
  final List<CarsModel> cars;

  CarSection({
    required this.title,
    required this.cars,
  });
}
