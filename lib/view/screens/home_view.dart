
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import '../../controller/car_controller.dart';
import '../app_widgets/car_widget/car_section_widget.dart';




class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      appBar: AppBar(
        title: Text(
          'RideHub',
          style: TextStyle(
            color: AppConstants.secondaryColor,
            fontSize:  AppConstants.size2,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<CarController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemCount: controller.carSections.length,
            itemBuilder: (context, index) {
              return CarSectionWidget(
                section: controller.carSections[index],
              );
            },
          );
        },
      ),
    );
  }
}
