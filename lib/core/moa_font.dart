import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';

const String _pretendard = "Pretendard";

class MoaFont {
  static Text headLineMedium({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 48.sp,
        height: 64.h / 48.sp,
        fontWeight: FontWeight.w700,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text headLineSmall({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 30.sp,
        height: 34.h / 30.sp,
        fontWeight: FontWeight.w700,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text titleLarge({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 24.sp,
        height: 32.h / 24.sp,
        fontWeight: FontWeight.w600,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text titleMedium({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 20.sp,
        height: 24.h / 20.sp,
        fontWeight: FontWeight.w600,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text titleSmall({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 18.sp,
        height: 22.h / 18.sp,
        fontWeight: FontWeight.w600,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text titleTiny({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 16.sp,
        height: 20.h / 16.sp,
        fontWeight: FontWeight.w600,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text labelLarge({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 20.sp,
        height: 24.h / 20.sp,
        fontWeight: FontWeight.w500,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text labelMedium({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 18.sp,
        height: 22.h / 18.sp,
        fontWeight: FontWeight.w500,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text labelSmall({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 16.sp,
        height: 20.h / 16.sp,
        fontWeight: FontWeight.w500,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text labelTiny({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 14.sp,
        height: 18.h / 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text bodyLarge({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 20.sp,
        height: 24.h / 20.sp,
        fontWeight: FontWeight.w400,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text bodyMedium({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 16.sp,
        height: 20.h / 16.sp,
        fontWeight: FontWeight.w400,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text bodySmall({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 14.sp,
        height: 18.h / 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? MoaColor.black,
      ),
    );
  }

  static Text bodyTiny({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _pretendard,
        fontSize: 12.sp,
        height: 16.h / 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? MoaColor.black,
      ),
    );
  }
}
