import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoryState extends Cubit<int> {
  HomeCategoryState() : super(0);

  void changeState(int value) {
    emit(value);
  }
}
