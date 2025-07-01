import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageController extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  String idFrontImagePath = "";
  String idBackImagePath = "";
  String licenseFrontImagePath = "";
  String licenseBackImagePath = "";

  Future<void> pickIdFrontImage() async {
    final pickedFile = await _picker.pickImage(source:ImageSource.gallery);
    if (pickedFile != null) {
      idFrontImagePath = pickedFile.path;
      notifyListeners();
    }
  }

  Future<void> pickIdBackImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      idBackImagePath = pickedFile.path;
      notifyListeners();
    }
  }

  Future<void> pickLicenseFrontImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      licenseFrontImagePath = pickedFile.path;
      notifyListeners();
    }
  }

  Future<void> pickLicenseBackImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      licenseBackImagePath = pickedFile.path;
      notifyListeners();
    }
  }
}
