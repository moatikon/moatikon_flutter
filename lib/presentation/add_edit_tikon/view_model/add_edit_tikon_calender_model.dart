import 'package:flutter/cupertino.dart';

class AddEditTikonCalenderModel {
  final LayerLink calenderLayerLink = LayerLink();
  DateTime date;
  bool isActive;
  OverlayEntry? overlay;

  AddEditTikonCalenderModel({
    required this.isActive,
    required this.overlay,
    required this.date,
  });

  AddEditTikonCalenderModel copyWith({
    bool? isActive,
    OverlayEntry? overlay,
    DateTime? date,
  }) {
    return AddEditTikonCalenderModel(
      isActive: isActive ?? this.isActive,
      overlay: overlay ?? this.overlay,
      date: date ?? this.date,
    );
  }
}
