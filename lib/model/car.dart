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
  String color;
  String carNumber;
  String transmissionType;

  double performanceScore;
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
    required this.color,
    required this.carNumber,
    required this.transmissionType,
    required this.performanceScore,
    required this.generalInfo,
    required this.reviews,
    required this.rate,
    this.isReserved = false,
    required this.price,
    required this.dateOfAdd,

  });

  // fromJson constructor


  // toJson method

}
