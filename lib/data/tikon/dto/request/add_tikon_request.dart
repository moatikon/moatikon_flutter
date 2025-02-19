import 'package:dio/dio.dart';
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
    return FormData.fromMap({
      "image": MultipartFile.fromFileSync(imageFile.path),
      "storeName": storeName,
      "tikonName": tikonName,
      "category": category,
      "discount": disCount,
      "dDay": finishedTikon,
    });
  }
}
