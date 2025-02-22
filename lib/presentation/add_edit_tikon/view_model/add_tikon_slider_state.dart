import 'package:flutter_bloc/flutter_bloc.dart';

class AddTikonSliderState extends Cubit<double>{
  AddTikonSliderState() : super(1);

  void init(){
    emit(1);
  }

  void changeState(double value){
    emit(value);
  }
}