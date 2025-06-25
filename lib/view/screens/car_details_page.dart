import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hub/constants/app_constants.dart';

import '../../constants/app_lang.dart';
import '../../model/car_details_model.dart';
import '../app_widgets/buttons/home_button.dart';
import '../app_widgets/buttons/my_back_button.dart';
import '../app_widgets/buttons/primary_button.dart';
import 'car_rating_view.dart';


class CarDetailPage extends StatefulWidget {
  final CarDetailModel car;

  const CarDetailPage({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          widget.car.brand,
          style: GoogleFonts.mulish(
            color: AppConstants.primaryTextColor,
            fontSize: AppConstants.size5,
            fontWeight: FontWeight.bold,
          )

        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left:15.w),
          child: MyBackButton(isFilled: false),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: HomeButton(),
          ),
        ],

        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(60),
          child: Container(
            color:AppConstants.secondaryColor,
            padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                _buildCustomTab(AppLang.getLang(context: context).general, 0),
                 SizedBox(width: 8.w),
                _buildCustomTab(AppLang.getLang(context: context).capabilities, 1),
                 SizedBox(width: 8.w),
                _buildCustomTab(AppLang.getLang(context: context).images, 2),
                SizedBox(width: 8.w),
                _buildCustomTab(AppLang.getLang(context: context).reviews, 3),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Car Image and Price Section
          Container(
            color: AppConstants.secondaryColor,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.car.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.directions_car,
                          size: 80,
                          color: Colors.grey.shade400,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.car.name,
                      style: GoogleFonts.mulish(
                        fontSize: AppConstants.size5,
                      )

                    ),
                    Text(
                      widget.car.price,
                      style:GoogleFonts.mulish(
                        fontSize: AppConstants.size8,
                        color: AppConstants.backgroundColor2,
                      )

                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGeneralTab(),
                _buildCapabilitiesTab(),
                _buildImagesTab(),
                _buildReviewsTab(),
              ],
            ),
          ),

          // Rate Button
          Container(
            padding: EdgeInsets.all(16),
            color:AppConstants.secondaryColor,
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: PrimaryButton(
                text: AppLang.getLang(context: context).rate,
                onClick: _showRatingDialog,
              ),

            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralTab() {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Info Cards
          Container(
            width: 380.w,
            height: 150.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color:  Color(0xFF5B4FCF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard('Mileage - 4500km', widget.car.mileage),
                _buildInfoCard('Insurance', widget.car.insurance),
                _buildInfoCard('Extras', widget.car.extras),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // General Information
         Text(AppLang.getLang(context: context).general_information
            ,
            style:GoogleFonts.mulish(
              fontSize: AppConstants.size5,
              color: AppConstants.primaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height:220.h ,
            width: 380.w,
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:  Color(0xFF5B4FCF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.car.generalInfo,
              style: TextStyle(
                fontSize: AppConstants.size7,
                color: AppConstants.secondaryTextColor1,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCapabilitiesTab() {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLang.getLang(context: context).capabilities,
            style: TextStyle(
              fontSize: AppConstants.size5,
              color: AppConstants.primaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF5B4FCF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 SizedBox(height: 16.h),

                _buildCapabilitySection('Engine Options:', widget.car.capabilities.engineOptions),
                _buildCapabilitySection('Fuel Efficiency:', [widget.car.capabilities.fuelEfficiency]),
                _buildCapabilitySection('Drive Options:', widget.car.capabilities.driveOptions),
                _buildCapabilitySection('Safety:', widget.car.capabilities.safety),
                _buildCapabilitySection('Technology:', widget.car.capabilities.technology),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImagesTab() {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
          //
          Container(
            height: 200.h,
            width: double.infinity,
            margin:  EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.car.images.isNotEmpty ? widget.car.images[0] : widget.car.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //  صورة كبيرة ثانية
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),

          ),

          //  صور إضافية إذا كانت متوفرة
          if (widget.car.images.length > 2)
            ...widget.car.images.skip(2).map((imagePath) => Container(
              // ... صور إضافية
            )).toList(),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        Container(
        width: 376.w,
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppConstants.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.car.reviews.map((review) {
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < review.stars ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 24,
                      );
                    }),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    review.reviewTitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    review.reviewDescription,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    _formatDate(review.date),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      )

      ],
      ),
                        );
                      }


  Widget _buildInfoCard(String title, String value) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200.w,
            child: Text(
              '$title:',
              style: GoogleFonts.mulish(
                fontSize: AppConstants.size7,
                fontWeight: FontWeight.bold,
              )

            ),
          ),
          Expanded(
            child: Text(
              value,
              style:GoogleFonts.mulish(
                fontSize: AppConstants.size7,
                color: Colors.grey.shade700,
              )

            ),
          ),
        ],
      ),
    );
  }



  Widget _buildCapabilitySection(String title, List<String> items) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppConstants.size7,
              color: AppConstants.secondaryTextColor1,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 4.h),
          ...items.map((item) => Padding(
            padding: EdgeInsets.only(left: 8.w, bottom: 2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: GoogleFonts.mulish(fontSize: 12)
                ),
                Expanded(
                  child: Text(
                    item,
                    style: GoogleFonts.mulish(
                      fontSize: AppConstants.size7,
                      color: AppConstants.secondaryTextColor1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  void _showRatingDialog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarRatingView(car: widget.car),
      ),
    );
  }

  Widget _buildCustomTab(String title, int index) {
    bool isSelected = _tabController.index == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tabController.animateTo(index);
          });
        },
        child: Container(
          width: 81.w,
          height: 38.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(

            border: Border.all(
              color: isSelected ? Colors.transparent : AppConstants. primaryColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(20.r),

            color: isSelected ? Colors.grey.shade200 :AppConstants.secondaryColor,
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color:  Colors.black ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

