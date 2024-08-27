import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/text_widget.dart';

class MoaButton extends StatelessWidget {
  final String text;
  final double textSize;
  final TextWeight textWeight;
  final double? width, height, borderRadius;
  final Color? color, fontColor;
  final Widget? leading;
  final GestureTapCallback? onTap;

  const MoaButton({
    required this.text,
    required this.textSize,
    required this.textWeight,
    this.fontColor,
    this.width,
    this.height,
    this.color,
    this.leading,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: leading ?? const SizedBox.shrink(),
            ),
            Center(
              child: TextWidget(
                text: text,
                color: fontColor,
                textSize: textSize,
                textWeight: textWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
