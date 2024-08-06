import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenSliderState extends Cubit<double>{
  AddScreenSliderState() : super(1);

  void init(){
    emit(1);
  }

  void changeState(double value){
    emit(value);
  }
}