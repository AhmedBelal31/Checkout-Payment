import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/payment_details_view_widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: buildCustomAppBar(context),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: ThankYouViewBody(),
          ),
        ],
      ),
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Row(
            children: [
              Center(
                child: GestureDetector(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/arrow.svg',
                    height: 24,
                  ),
                ),
              ),
            ],
          );
  }
}
