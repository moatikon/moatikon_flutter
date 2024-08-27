import 'package:flutter/cupertino.dart';

class AddTikonCalenderModel {
  final LayerLink calenderLayerLink = LayerLink();
  DateTime date;
  bool isActive;
  OverlayEntry? overlay;

  AddTikonCalenderModel({
    required this.isActive,
    required this.overlay,
    required this.date,
  });

  AddTikonCalenderModel copyWith({
    bool? isActive,
    OverlayEntry? overlay,
    DateTime? date,
  }) {
    return AddTikonCalenderModel(
      isActive: isActive ?? this.isActive,
      overlay: overlay ?? this.overlay,
      date: date ?? this.date,
    );
  }
}
