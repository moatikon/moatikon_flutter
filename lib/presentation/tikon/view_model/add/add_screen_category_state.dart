import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenCategoryState extends Cubit<int> {
  AddScreenCategoryState() : super(0);

  void init(){
    emit(0);
  }

  void changeState(int state){
    emit(state);
  }

  String categoryBuilder(){
    switch(state){
      case 0:
        return "MEAL";
      case 1:
        return "DRINT";
      case 2:
        return "OBJECT";
      default:
        return "ETC";
    }
  }
}