import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ride_hub/constants/app_constants.dart';
import 'package:ride_hub/constants/app_lang.dart';
import 'package:ride_hub/controller/upload_image_controller.dart';
import 'package:ride_hub/view/app_widgets/buttons/secondary_button.dart';
import 'package:ride_hub/view/app_widgets/picture_box.dart';
/// hint with upload photos for  id and license

class UploadPhotoBox extends StatelessWidget {
  String title;
  ///0 for id ,1 for license
  int flag;
  UploadPhotoBox({super.key, required this.title, required this.flag});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      height:(MediaQuery.of(context).size.height-150),
      decoration: BoxDecoration(
        color: AppConstants.secondaryColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 4, color: AppConstants.secondaryColor2),
      ),
      child:Consumer<UploadImageController>(builder:(context,uploadImageController, child) {
        return Column(
          children: [
            //title
            Padding(
              padding: EdgeInsets.only(left: 37.w, top: 21.h),
              child: Text(
                title,
                style: GoogleFonts.mulish(
                  fontSize: AppConstants.size2,
                  fontWeight: FontWeight.normal,
                  height: 1,
                  color: AppConstants.primaryTextColor2,
                ),
              ),
            ),
            //front photo label and load photo button
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //front photo label
                  Text(
                    AppLang.getLang(context: context).front,
                    style: GoogleFonts.mulish(
                      fontSize: AppConstants.size9,
                      fontWeight: FontWeight.normal,
                      height: 1,
                      color: AppConstants.secondaryTextColor3,
                    ),
                  ),
                  //load photo button
                  IconButton(
                    onPressed: () {
                      //front photo
                      if(flag==0){
                        //id front photo
                        uploadImageController.pickIdFrontImage();
                      }else{
                        //license front  photo
                        uploadImageController.pickLicenseFrontImage();
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            //picture box for front photo
            PictureBox(
              imagePath:flag==0?uploadImageController.idFrontImagePath:uploadImageController.licenseFrontImagePath,
              initialImageAssetsPath:flag==1?"assets/images/license_template_image.png":"assets/images/id_template_image.png",
            ),
            SizedBox(height:24.h,),
            //back photo label and load photo button
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //front photo label
                  Text(
                    AppLang.getLang(context: context).back,
                    style: GoogleFonts.mulish(
                      fontSize: AppConstants.size9,
                      fontWeight: FontWeight.normal,
                      height: 1,
                      color: AppConstants.secondaryTextColor3,
                    ),
                  ),
                  //load photo button
                  IconButton(
                    onPressed: () {
                      //back photo
                      if(flag==0){
                        //id back photo
                        uploadImageController.pickIdBackImage();
                      }else{
                        //license back photo
                        uploadImageController.pickLicenseBackImage();
                      }
                    },
                    icon:Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(height:20.h),
            //picture box for back photo
            PictureBox(
              imagePath:flag==0?uploadImageController.idBackImagePath:uploadImageController.licenseBackImagePath,
              initialImageAssetsPath:flag==1?"assets/images/license_template_image.png":"assets/images/id_template_image.png",
            ),
            SizedBox(height:12.h,),
            SecondaryButton(text:AppLang.getLang(context: context).done, onClick:(){
              Navigator.pop(context);

            }, width:272)
          ],


        );
      },),
    );
  }
}
