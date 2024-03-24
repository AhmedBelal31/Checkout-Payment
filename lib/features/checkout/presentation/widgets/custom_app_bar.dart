import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/styles.dart';

AppBar buildAppBar({required String title, void Function()? onTap}) {
  return AppBar(
    leading: Center(
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
          height: 24,
        ),
      ),
    ),
    title: Text(
      title,
      style: AppStyles.style25,
    ),
    centerTitle: true,
    scrolledUnderElevation: 0,
  );
}
