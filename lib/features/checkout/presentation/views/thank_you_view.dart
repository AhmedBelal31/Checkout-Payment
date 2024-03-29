import 'package:checkout_payment/features/checkout/presentation/widgets/payment_details_view_widgets/thank_you_card.dart';
import 'package:flutter/material.dart';
import '../widgets/payment_details_view_widgets/dash_line.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    int screenWidth = MediaQuery.sizeOf(context).width.toInt();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(
          top: 50,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const ThankYouCard(),
            Positioned(
              right: 0,
              left: 0,
              top: -50,
              child: buildDoneIcon(),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2,
              left: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2,
              right: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .22,
              left: 25,
              right: 25,
              child: DashedLine(screenWidth: screenWidth),
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar buildDoneIcon() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFD9D9D9),
      child: CircleAvatar(
        backgroundColor: Color(0xFf34A835),
        radius: 40,
        child: Icon(
          Icons.done,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
