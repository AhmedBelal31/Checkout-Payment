import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonText ;
  const CustomButton({super.key ,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 73,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFf34A835),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
        ),
        child: Text(buttonText, style: AppStyles.style22,),
      ),
    );
  }
}
