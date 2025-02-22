import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditTikonSliderState extends Cubit<double>{
  AddEditTikonSliderState() : super(1);

  void init(){
    emit(1);
  }

  void changeState(double value){
    emit(value);
  }
}