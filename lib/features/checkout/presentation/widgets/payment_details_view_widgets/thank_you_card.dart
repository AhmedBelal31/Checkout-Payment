import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../my_cart_view_widgets/total_price.dart';
import 'card_info_widget.dart';
import 'payment_info_item.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
      child: Column(
        children: [
          const Text(
            'Thank you!',
            textAlign: TextAlign.center,
            style: AppStyles.style25,
          ),
          Text(
            'Your transaction was successful',
            textAlign: TextAlign.center,
            style: AppStyles.style20,
          ),
          const SizedBox(
            height: 42,
          ),
          const PaymentItemInfo(
            title: 'Date',
            value: '01/24/2023',
          ),
          const SizedBox(
            height: 20,
          ),
          const PaymentItemInfo(
            title: 'Time',
            value: '10:15 AM',
          ),
          const SizedBox(
            height: 20,
          ),
          const PaymentItemInfo(
            title: 'To',
            value: 'Sam Louis',
          ),
          const Divider(
            height: 60,
            thickness: 2,
          ),
          const TotalPrice(title: 'Total', price: r'$50.97'),
          const SizedBox(
            height: 30,
          ),
          const CardInfoWidget(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                FontAwesomeIcons.barcode,
                size: 64,
              ),
              Container(
                width: 113,
                height: 58,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1.50, color: Color(0xFF34A853)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'PAID',
                    textAlign: TextAlign.center,
                    style: AppStyles.style24
                        .copyWith(color: const Color(0xff34A853)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
          ),
        ],
      ),
    );
  }
}
