import 'package:flutter/material.dart';
import 'package:moatikon_flutter/core/moa_color.dart';

class MoaLoadingIndicator extends StatelessWidget {
  const MoaLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: MoaColor.red100,
        ),
      ),
    );
  }
}
