import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tag_state.dart';

Future<List<BlocProvider>> di() async {
  return [
    BlocProvider<TagState>(create: (context) => TagState()),
  ];
}