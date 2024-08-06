import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenTagState extends Cubit<int> {
  HomeScreenTagState() : super(0);

  void changeState(int state){
    emit(state);
  }
}