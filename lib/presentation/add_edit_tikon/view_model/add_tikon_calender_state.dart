import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_tikon_calender_overlay.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_calender_model.dart';


class AddTikonCalenderState extends Cubit<AddTikonCalenderModel>{
  AddTikonCalenderState()
      : super(
          AddTikonCalenderModel(
            isActive: false,
            overlay: null,
            date: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        );

  void init() {
    emit(AddTikonCalenderModel(
      isActive: false,
      overlay: null,
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    ));
  }

  void overlayCalenderInset({required BuildContext context}) {
    emit(
      state.copyWith(
        isActive: true,
        overlay: OverlayEntry(
          builder: (_) => AddTikonCalenderOverlay(
            link: state.calenderLayerLink,
            selectedDate: state.date,
            saveDate: saveDate,
            removeCalender: overlayRemove,
          ),
        ),
      ),
    );

    Navigator.of(context).overlay!.insert(state.overlay!);
  }

  void saveDate({required DateTime date}) {
    emit(state.copyWith(date: date));
  }

  void overlayRemove() {
    state.overlay!.remove();
    emit(state.copyWith(isActive: false, overlay: null));
  }

  void calenderDateReset() {
    emit(state.copyWith(
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    ));
  }

  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd").format(state.date);
  }
}