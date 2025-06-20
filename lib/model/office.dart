class Office {
  String name;
  String imgLink;
  double rate;
  int numberOfReservations;

  Office({
    required this.name,
    required this.imgLink,
    required this.rate,
    required this.numberOfReservations,
  });

  // fromJson constructor
  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      name: json['name'],
      imgLink: json['imgLink'],
      rate: (json['rate'] as num).toDouble(),
      numberOfReservations: json['numberOfReservations'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imgLink': imgLink,
      'rate': rate,
      'numberOfReservations': numberOfReservations,
    };
  }
}
