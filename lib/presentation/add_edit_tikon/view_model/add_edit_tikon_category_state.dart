import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditTikonCategoryState extends Cubit<int> {
  AddEditTikonCategoryState() : super(0);

  void changeState(int state) {
    emit(state);
  }
}