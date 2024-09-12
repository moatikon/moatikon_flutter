import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddTikonImageStateCubit extends Cubit<XFile?> {
  AddTikonImageStateCubit() : super(null);

  XFile? get file => state;

  void setFile(XFile file){
    emit(file);
  }
}
