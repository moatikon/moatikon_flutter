import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddTikonRequest {
  final String storeName, tikonName, category, finishedTikon;
  final int disCount;
  final XFile imageFile;

  AddTikonRequest({
    required this.imageFile,
    required this.storeName,
    required this.tikonName,
    required this.category,
    required this.finishedTikon,
    required this.disCount,
  });

  Future<FormData> toForm() async {
    String? nullAbleDeviceToken = await FirebaseMessaging.instance.getToken();
    String deviceToken = nullAbleDeviceToken!;

    return FormData.fromMap({
      "image": MultipartFile.fromFileSync(imageFile.path),
      "storeName": storeName,
      "tikonName": tikonName,
      "category": category,
      "finishedTikon": finishedTikon,
      "discount": disCount,
      "deviceToken": deviceToken,
    });
  }
}
