import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/styles.dart';
import '../widgets/my_cart_view_widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset(
            'assets/images/arrow.svg',
            height: 24,
          ),
        ),
        title: Text(
          'My Cart ',
          style: AppStyles.style25,
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: MyCartViewBody(),
    );
  }
}

