import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  final String title;
  final String price;

  const TotalPrice({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title , style: AppStyles.style24,),
        const Spacer(),
        Text('$price\$',style: AppStyles.style24,),
      ],
    );
  }
}
