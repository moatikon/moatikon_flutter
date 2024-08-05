import 'package:flutter_bloc/flutter_bloc.dart';

class SliderState extends Cubit<double>{
  SliderState() : super(1);

  void changeState(double value){
    emit(value);
  }
}