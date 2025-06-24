class Car {
  String name;
  List<String> imagesLinks;
  String model;
  int year;
  double rentCost;
  // capabilities
  String engineType;
  double engineCapacity;
  int hoursPower;
  String fuel;
  //general
  int seatCapacity;
  double mileage;

  String generalInfo;
  int reviews;
  double rate;
  bool isReserved;
  double price;
  String dateOfAdd;

  Car({
    required this.name,
    required this.imagesLinks,
    required this.model,
    required this.year,
    required this.rentCost,
    required this.engineType,
    required this.engineCapacity,
    required this.hoursPower,
    required this.fuel,
    required this.seatCapacity,
    required this.mileage,
    required this.generalInfo,
    required this.reviews,
    required this.rate,
    this.isReserved = false,
    required this.price,
    required this.dateOfAdd,
  });

  // fromJson constructor
  // factory Car.fromJson(Map<String, dynamic> json) {
  //   return Car(
  //     name: json['name'],
  //     imagesLinks: List<String>.from(json['imagesLinks']),
  //     model: json['model'],
  //     year: json['year'],
  //     rentCost: (json['rentCost'] as num).toDouble(),
  //     capabilities: json['capabilities'],
  //     generalInfo: json['generalInfo'],
  //     reviews: json['reviews'],
  //     rate: (json['rate'] as num).toDouble(),
  //     isReserved: json['isReserved'] ?? false,
  //     price: (json['price'] as num).toDouble(),
  //     dateOfAdd: json['dateOfAdd'],
  //   );
  // }

  // toJson method
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'imagesLinks': imagesLinks,
  //     'model': model,
  //     'year': year,
  //     'rentCost': rentCost,
  //     'capabilities': capabilities,
  //     'generalInfo': generalInfo,
  //     'reviews': reviews,
  //     'rate': rate,
  //     'isReserved': isReserved,
  //     'price': price,
  //     'dateOfAdd': dateOfAdd,
  //   };
  // }
}
