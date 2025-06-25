import 'package:flutter/material.dart';
import '../constants/app_lang.dart';
import '../model/car_details_model.dart';
import '../model/cars_model.dart';
import '../model/review_model.dart';


class CarController extends ChangeNotifier {
  String? _selectedCarId;

  String? get selectedCarId => _selectedCarId;

  final List<CarSection> _carSections = [
    CarSection(
      title: 'Economical Cars',
      cars: [
        CarsModel(id: 'eco_mercedes', brand: 'Mercedes', imagePath: 'assets/images/test_images/mercedes.png', count: 32),
        CarsModel(id: 'eco_bmw', brand: 'BMW', imagePath: 'assets/images/test_images/bmw.png', count: 12),
        CarsModel(id: 'eco_maserati', brand: 'Maserati', imagePath: 'assets/images/test_images/masrerati.png', count: 5),
        CarsModel(id: 'eco_porsche', brand: 'Porsche', imagePath: 'assets/images/test_images/porsche.png', count: 8),
      ],
    ),
    CarSection(
      title: 'Electric cars',
      cars: [
        CarsModel(id: 'elec_mercedes', brand: 'Mercedes', imagePath: 'assets/images/test_images/mercedes.png', count: 32),
        CarsModel(id: 'elec_bmw', brand: 'BMW', imagePath: 'assets/images/test_images/bmw.png', count: 12),
        CarsModel(id: 'elec_maserati', brand: 'Maserati', imagePath: 'assets/images/test_images/masrerati.png', count: 5),
        CarsModel(id: 'elec_porsche', brand: 'Porsche', imagePath: 'assets/images/test_images/porsche.png', count: 8),
      ],
    ),
    CarSection(
      title: 'Luxury cars',
      cars: [
        CarsModel(id: 'lux_mercedes', brand: 'Mercedes', imagePath: 'assets/images/test_images/mercedes.png', count: 32),
        CarsModel(id: 'lux_bmw', brand: 'BMW', imagePath: 'assets/images/test_images/bmw.png', count: 12),
        CarsModel(id: 'lux_maserati', brand: 'Maserati', imagePath: 'assets/images/test_images/masrerati.png', count: 6),
        CarsModel(id: 'lux_porsche', brand: 'Porsche', imagePath: 'assets/images/test_images/porsche.png', count: 8),
      ],
    ),
    CarSection(
      title: 'Buses and public transportation',
      cars: [
        CarsModel(id: 'bus_mercedes', brand: 'Mercedes', imagePath: 'assets/images/test_images/mercedes.png', count: 32),
        CarsModel(id: 'bus_bmw', brand: 'BMW', imagePath: 'assets/images/test_images/bmw.png', count: 12),
        CarsModel(id: 'bus_maserati', brand: 'Maserati', imagePath: 'assets/images/test_images/masrerati.png', count: 5),
        CarsModel(id: 'bus_porsche', brand: 'Porsche', imagePath: 'assets/images/test_images/porsche.png', count: 8),
      ],
    ),
  ];

  // بيانات السيارات التفصيلية
  final Map<String, List<CarDetail>> _carDetails = {
    'Economical Cars': [
      CarDetail(
        id: 'eco_detail_1',
        name: 'S 500 Sedan',
        brand: 'Mercedes',
        imagePath: 'assets/images/test_images/mercedes.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
      CarDetail(
        id: 'eco_detail_2',
        name: 'Audi',
        brand: 'BMW',
        imagePath: 'assets/images/test_images/bmw.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
      CarDetail(
        id: 'eco_detail_3',
        name: 'Hyundai',
        brand: 'Honda',
        imagePath: 'assets/images/test_images/masrerati.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
      CarDetail(
        id: 'eco_detail_4',
        name: 'RAV4 Hybrid',
        brand: 'Toyota',
        imagePath: 'assets/images/test_images/porsche.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
    ],
    'Electric cars': [
      CarDetail(
        id: 'elec_detail_1',
        name: 'EQS Electric',
        brand: 'Mercedes',
        imagePath: 'assets/images/test_images/mercedes.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
      CarDetail(
        id: 'elec_detail_2',
        name: 'i4 Electric',
        brand: 'BMW',
        imagePath: 'assets/images/test_images/bmw.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
    ],
    'Luxury cars': [
      CarDetail(
        id: 'lux_detail_1',
        name: 'S-Class Luxury',
        brand: 'Mercedes',
        imagePath: 'assets/images/test_images/mercedes.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
      CarDetail(
        id: 'lux_detail_2',
        name: '7 Series',
        brand: 'BMW',
        imagePath: 'assets/images/test_images/bmw.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
    ],
    'Buses and public transportation': [
      CarDetail(
        id: 'bus_detail_1',
        name: 'Sprinter Bus',
        brand: 'Mercedes',
        imagePath: 'assets/images/test_images/mercedes.png',
        year: 2023,
        price: 'xxxxx JD',
      ),
    ],
  };

  // بيانات السيارات المفصلة الكاملة
  final Map<String, CarDetailModel> _fullCarDetails = {
    'eco_detail_1': CarDetailModel(
      id: 'eco_detail_1',
      name: 'Toyota',
      brand: 'Maserati',
      imagePath: 'assets/images/test_images/porsche.png',
      price: '85 JD / day',
      mileage: '4500km',
      insurance: 'Standard',
      extras: 'Additional Driver\nChild Seats - 2',
      generalInfo: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
      capabilities: CarCapabilities(
        engineOptions: [
          '2.5L 4-cylinder (203-206 hp)',
          '3.5L V6 (301 hp) for higher trims'
        ],
        fuelEfficiency: '~29-41 mpg (city/highway)',
        driveOptions: [
          'Front-Wheel Drive (FWD)',
          'All-Wheel Drive'
        ],
        safety: [
          'Toyota Safety Sense P (TSS-P): Pre-collision, lane departure alert, adaptive cruise control'
        ],
        technology: [
          '7-8" touchscreen, Apple CarPlay, Android Auto, Wi-Fi hotspot'
        ],
      ),
      images: [
        'assets/images/test_images/porsche.png',
        'assets/images/test_images/mercedes.png',
        'assets/images/test_images/bmw.png',
        'assets/images/test_images/maserati.png',
      ],
      reviews: [
        Review(
          carId: 'eco_bmw',
          userId: 'User123',
          stars: 4,
          reviewTitle: 'Great Car!',
          reviewDescription: 'The car was clean, smooth to drive, and fuel efficient.',
          reviewStatus: ReviewStatus.approved,
          date: DateTime(2025, 6, 25),
        ),
      ],

    ),

  };

  List<CarSection> get carSections => _carSections;

  void selectCar(String carId) {
    if (_selectedCarId == carId) {
      _selectedCarId = null;
    } else {
      _selectedCarId = carId;
    }
    notifyListeners();
  }

  bool isCarSelected(String carId) {
    return _selectedCarId == carId;
  }

  List<CarDetail> getCarDetails(String sectionTitle) {
    return _carDetails[sectionTitle] ?? [];
  }

  CarDetailModel? getFullCarDetail(String carId) {
    return _fullCarDetails[carId];
  }



  }


