import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed ;

  const CustomButton({super.key, required this.buttonText , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0 , left: 16 , right: 16),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFf34A835),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          child: Text(
            buttonText,
            style: AppStyles.style22,
          ),
        ),
      ),
    );
  }
}
