import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/model/office.dart';
import 'package:ride_hub/view/app_widgets/buttons/primary_button.dart';
import 'package:ride_hub/view/app_widgets/home_vertical_list.dart';
import 'package:ride_hub/view/app_widgets/inputs/base_text.dart';

class RentalHome extends StatelessWidget {
  RentalHome({super.key});

  List<Office> economicOffices = [
    Office(
      name: 'Office 1',
      imgLink: 'assets/testImages/carOffice1.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 2',
      imgLink: 'assets/testImages/carOffice2.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 3',
      imgLink: 'assets/testImages/carOffice3.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 4',
      imgLink: 'assets/testImages/carOffice4.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 5',
      imgLink: 'assets/testImages/carOffice5.png',
      rate: 4,
      numberOfReservations: 200,
    ),
  ];
  List<Office> electricOffices = [
    Office(
      name: 'Office 1',
      imgLink: 'assets/testImages/carOffice1.png',
      rate: 4.5,
      numberOfReservations: 220,
    ),
    Office(
      name: 'Office 2',
      imgLink: 'assets/testImages/carOffice2.png',
      rate: 4.5,
      numberOfReservations: 220,
    ),
    Office(
      name: 'Office 3',
      imgLink: 'assets/testImages/carOffice3.png',
      rate: 4.5,
      numberOfReservations: 220,
    ),
    Office(
      name: 'Office 4',
      imgLink: 'assets/testImages/carOffice4.png',
      rate: 4.5,
      numberOfReservations: 220,
    ),
    Office(
      name: 'Office 5',
      imgLink: 'assets/testImages/carOffice5.png',
      rate: 4.5,
      numberOfReservations: 220,
    ),
  ];
  List<Office> luxuryOffices = [
    Office(
      name: 'Office 1',
      imgLink: 'assets/testImages/carOffice1.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 2',
      imgLink: 'assets/testImages/carOffice2.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 3',
      imgLink: 'assets/testImages/carOffice3.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 4',
      imgLink: 'assets/testImages/carOffice4.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 5',
      imgLink: 'assets/testImages/carOffice5.png',
      rate: 4,
      numberOfReservations: 200,
    ),
  ];
  List<Office> busesOffices = [
    Office(
      name: 'Office 1',
      imgLink: 'assets/testImages/carOffice1.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 2',
      imgLink: 'assets/testImages/carOffice2.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 3',
      imgLink: 'assets/testImages/carOffice3.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 4',
      imgLink: 'assets/testImages/carOffice4.png',
      rate: 4,
      numberOfReservations: 200,
    ),
    Office(
      name: 'Office 5',
      imgLink: 'assets/testImages/carOffice5.png',
      rate: 4,
      numberOfReservations: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: Center(
          child: BaseText(
            text: 'RideHub',
            fontSize: AppConstants.size2.sp,
            FontFamily: '',
            textColor: AppConstants.secondaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    PrimaryButton(text: 'Previous Rental Requests', onClick: () {}),
                    SizedBox(height: 20.h),
                    HomeVerticalList(
                      listTitle: AppLang.getLang(context: context).economic_cars,
                      officeList: economicOffices,
                    ),
                    HomeVerticalList(
                      listTitle: AppLang.getLang(context: context).electric_cars,
                      officeList: electricOffices,
                    ),
                    HomeVerticalList(
                      listTitle: AppLang.getLang(context: context).luxury_cars,
                      officeList: luxuryOffices,
                    ),
                    HomeVerticalList(
                      listTitle:
                          AppLang.getLang(
                            context: context,
                          ).buses_and_public_transportation,
                      officeList: busesOffices,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
