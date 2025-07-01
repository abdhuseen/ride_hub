class Office {
  String name;
  String imgLink;
  double rate;
  int numberOfReservations;
  String location;
  String phoneNumber;
  String description;
  int reviews;

  Office({
    required this.name,
    required this.imgLink,
    required this.rate,
    required this.numberOfReservations,
    required this.description,
    required this.location,
    required this.phoneNumber,
    required this.reviews
  });

  // fromJson constructor
  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      name: json['name'],
      imgLink: json['imgLink'],
      rate: (json['rate'] as num).toDouble(),
      numberOfReservations: json['numberOfReservations'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      description: json['description'],
      reviews:json["reviews"]
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imgLink': imgLink,
      'rate': rate,
      'numberOfReservations': numberOfReservations,
      'description' :description,
      'phoneNumber' : phoneNumber,
      'loaction' : location,
       'reviews':reviews
    };
  }
}
