import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    required this.screenWidth,
  });

  final int screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        // 40 Outer Padding , 50 for Shape Right And Left
        //(5+2) 5=> For element width and 2  for element padding
        (screenWidth - 40 - 50) ~/ (7 + 2),
        (index) => Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Container(
            height: 2,
            width: 7,
            color: const Color(0xffB8B8B8),
          ),
        ),
      ),
    );
  }
}
