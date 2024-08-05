import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreenTagState extends Cubit<int> {
  AddScreenTagState() : super(0);

  void changeState(int state){
    emit(state);
  }
}