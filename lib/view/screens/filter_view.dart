import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_lang.dart';
import '../../controller/filter_controller.dart';
import '../app_widgets/buttons/primary_button.dart';
import '../app_widgets/buttons/txt_button.dart';




class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilterController(),
      child: Scaffold(
        backgroundColor:AppConstants.secondaryColor,
        body: SafeArea(
          child: Consumer<FilterController>(
            builder: (context, controller, child) {
              return Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLang.getLang(context: context).clear_all,
                          style: GoogleFonts.mulish(
                            fontSize: AppConstants.size5,
                            color: Colors.black,

                          ),
                        ),
                        GestureDetector(
                          onTap: controller.clearAll,
                          child: Row(
                            children: [
                              TxtButton(
                                text:AppLang.getLang(context: context). filter_by,
                                onClick: () {
                                },
                                textStyle: GoogleFonts.mulish(
                                  fontSize: AppConstants.size9,
                                  color: AppConstants.primaryTextColor,
                                ),

                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.close,
                                size: AppConstants.size9,
                                color: AppConstants.primaryTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      padding:  EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand Section
                          _buildSectionTitle(AppLang.getLang(context: context).brand),
                          SizedBox(height: 12.h),
                          _buildBrandSection(controller),
                          SizedBox(height: 30.h),

                          // Added Day Section
                          _buildSectionTitle(AppLang.getLang(context: context).added_day),
                          SizedBox(height: 12.h),
                          _buildDateSection(context, controller),

                          SizedBox(height: 30.h),

                          // Price Range Section
                          _buildSectionTitle(AppLang.getLang(context: context).price_range),
                          SizedBox(height: 12.h),
                          _buildPriceRangeSection(controller),
                          SizedBox(height: 30.h),

                          // Rate Range Section
                          _buildSectionTitle(AppLang.getLang(context: context).rate_range),
                          SizedBox(height: 12.h),
                          _buildRateRangeSection(controller),
                          SizedBox(height: 32.h),
                        ],
                      ),
                    ),
                  ),

                  // Show Result Button
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: PrimaryButton(
                      text: '${AppLang.getLang(context: context).show_result} (${controller.getResultCount()})',
                      onClick: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.mulish(
        fontSize: AppConstants.size6,
        color: AppConstants.backgroundColor1,
      )

    );
  }

  Widget _buildBrandSection(FilterController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.brands.map((brand) {
          bool isSelected = controller.isBrandSelected(brand.name);
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () => controller.toggleBrand(brand.name),
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? const Color(0xFF5B4FCF) : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  color: isSelected ? const Color(0xFF5B4FCF).withOpacity(0.1) : Colors.white,
                ),
                child: Container(
                  width: 77.w,
                  height: 77.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      'assets/images/${brand.logoPath}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }



  Widget  _buildDateSection(BuildContext context, FilterController controller) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            width: 178.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.filter.selectedMonth,
                hint: Text(AppLang.getLang(context: context).month)
                ,
                isExpanded: true,
                items: controller.months.map((month) {
                  return DropdownMenuItem(
                    value: month,
                    child: Text(month),
                  );
                }).toList(),
                onChanged: controller.setMonth,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 40.h,
            width: 178.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.filter.selectedYear,
                hint: Text(AppLang.getLang(context: context).year),
                isExpanded: true,
                items: controller.years.map((year) {
                  return DropdownMenuItem(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                onChanged: controller.setYear,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRangeSection(FilterController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height:20.h,
              width: 24.w,
              padding:EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${controller.filter.minPrice.round()}\$',
                style:  TextStyle(color:AppConstants.secondaryColor, fontSize: 8),
              ),
            ),
            Container(
              height:20.h,
              width: 24.w,
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${controller.filter.maxPrice.round()}\$',
                style:  TextStyle(color: AppConstants.secondaryColor, fontSize: 8),
              ),
            ),
          ],
        ),
        RangeSlider(
          values: RangeValues(controller.filter.minPrice, controller.filter.maxPrice),
          min: 50,
          max: 500,
          activeColor:AppConstants.primaryColor,
          onChanged: (values) {
            controller.setPriceRange(values.start, values.end);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height:37.h,
              width: 77.w,
              padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                '${controller.filter.minPrice.round()}\$',
                style:  TextStyle(color:AppConstants.secondaryColor),
              ),
            ),
            Container(
              height:37.h,
              width: 77.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color:  AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                '${controller.filter.maxPrice.round()}\$',
                style: TextStyle(color:AppConstants.secondaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRateRangeSection(FilterController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height:20.h,
              width: 24.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  '${controller.filter.minRate.round()}',
                  style:  TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),

            ),
            Container(
              height:20.h,
              width: 24.w,
              padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  '${controller.filter.maxRate.round()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              ),

            ),
          ],
        ),
        RangeSlider(
          values: RangeValues(controller.filter.minRate, controller.filter.maxRate),
          min: 1,
          max: 5,
          divisions: 4,
          activeColor:  AppConstants.primaryColor,
          onChanged: (values) {
            controller.setRateRange(values.start, values.end);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height:37.h,
              width: 77.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color:AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Text(
                  '${controller.filter.minRate.round()}',
                  style:  TextStyle(color: AppConstants.secondaryColor),
                ),
              ),

            ),
            Container(
              height:37.h,
              width: 77.w,
              padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color:   AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Text(
                  '${controller.filter.maxRate.round()}',
                  style:TextStyle(color: AppConstants.secondaryColor),
                ),
              ),

            ),
          ],
        ),
      ],
    );
  }
}
