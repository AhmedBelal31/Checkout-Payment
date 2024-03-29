import 'package:checkout_payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:checkout_payment/test_view.dart';
import 'package:flutter/material.dart';

import 'features/checkout/presentation/views/payment_details_view.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout Payment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:const MyCartView(),
    );
  }
}
