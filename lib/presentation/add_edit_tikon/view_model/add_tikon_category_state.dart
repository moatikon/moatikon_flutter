import 'package:flutter_bloc/flutter_bloc.dart';

class AddTikonCategoryState extends Cubit<int> {
  AddTikonCategoryState() : super(0);

  void changeState(int state) {
    emit(state);
  }
}