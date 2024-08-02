import 'package:flutter_bloc/flutter_bloc.dart';

class TagState extends Cubit<int> {
  TagState() : super(0);

  void changeState(int state){
    emit(state);
  }
}