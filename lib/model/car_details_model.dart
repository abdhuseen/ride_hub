import 'package:ride_hub/model/review_model.dart';

class CarCapabilities {
  final List<String> engineOptions;
  final String fuelEfficiency;
  final List<String> driveOptions;
  final List<String> safety;
  final List<String> technology;

  CarCapabilities({
    required this.engineOptions,
    required this.fuelEfficiency,
    required this.driveOptions,
    required this.safety,
    required this.technology,
  });

  factory CarCapabilities.fromJson(Map<String, dynamic> json) {
    return CarCapabilities(
      engineOptions: List<String>.from(json['engineOptions']),
      fuelEfficiency: json['fuelEfficiency'],
      driveOptions: List<String>.from(json['driveOptions']),
      safety: List<String>.from(json['safety']),
      technology: List<String>.from(json['technology']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'engineOptions': engineOptions,
      'fuelEfficiency': fuelEfficiency,
      'driveOptions': driveOptions,
      'safety': safety,
      'technology': technology,
    };
  }
}

class CarDetailModel {
  final String id;
  final String name;
  final String brand;
  final String imagePath;
  final String price;
  final String mileage;
  final String insurance;
  final String extras;
  final String generalInfo;
  final CarCapabilities capabilities;
  final List<String> images;
  final List<Review> reviews;

  CarDetailModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.imagePath,
    required this.price,
    required this.mileage,
    required this.insurance,
    required this.extras,
    required this.generalInfo,
    required this.capabilities,
    required this.images,
    required this.reviews,
  });

  factory CarDetailModel.fromJson(Map<String, dynamic> json) {
    return CarDetailModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      imagePath: json['imagePath'],
      price: json['price'],
      mileage: json['mileage'],
      insurance: json['insurance'],
      extras: json['extras'],
      generalInfo: json['generalInfo'],
      capabilities: CarCapabilities.fromJson(json['capabilities']),
      images: List<String>.from(json['images']),
      reviews: (json['reviews'] as List<dynamic>)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'imagePath': imagePath,
      'price': price,
      'mileage': mileage,
      'insurance': insurance,
      'extras': extras,
      'generalInfo': generalInfo,
      'capabilities': capabilities.toJson(),
      'images': images,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}