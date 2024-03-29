import 'package:checkout_payment/features/checkout/presentation/widgets/payment_details_view_widgets/payment_view_body.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Payment Details ',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: const PaymentViewBody(),
    );
  }
}
