import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moatikon_flutter/core/dio.dart';
import 'package:path_provider/path_provider.dart';

class AddEditTikonImageState extends Cubit<XFile?> {
  AddEditTikonImageState() : super(null);

  XFile? get file => state;

  void setFile(XFile file) {
    emit(file);
  }

  void urlToXFile(String imageUrl) async {
    try {
      // 1. 임시 디렉토리 가져오기
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/downloaded_image.jpg';

      // 2. Dio를 사용하여 파일 다운로드
      await dio.download(imageUrl, filePath);

      // 3. 저장된 파일을 XFile로 변환 후 반환
      emit(XFile(filePath));
    } catch (e) {
      throw Exception("에러 발생: $e");
    }
  }
}
