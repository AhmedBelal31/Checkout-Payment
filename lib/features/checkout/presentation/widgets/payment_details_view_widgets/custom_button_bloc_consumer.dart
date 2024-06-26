import 'dart:developer';

import 'package:checkout_payment/core/utils/paypal_keys.dart';
import 'package:checkout_payment/core/utils/stripe_keys.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../controller/payment_cubit/payment_cubit.dart';
import '../../views/my_cart_view.dart';
import '../custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final bool isPaypal;
  const CustomButtonBlocConsumer({super.key , required this.isPaypal});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentSuccessState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankYouView(),
          ));
        }
        if (state is PaymentFailureState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoadingState,
          buttonText: 'Continue',
          onPressed: () {
            if (isPaypal) {
              var transactionsData = getTransactionsData();
              executePaypalPayment(context, transactionsData);
            } else {
              executeStripePayment(context);
            }
          },
        );
      },
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
        amount: '100', currency: 'USD', customerId: StripeKeys.stripeCustomId);
    BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }

  void executePaypalPayment(BuildContext context, transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: PaypalKeys.paypalClientId,
          secretKey: PaypalKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const ThankYouView();
              }),
                  (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onError: (error) {
            SnackBar snackBar = SnackBar(content: Text(error.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const MyCartView();
              }),
                  (route) {
                return false;
              },
            );
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  getTransactionsData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(shipping: '0', shippingDiscount: 0, subtotal: '100'),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: '10',
        quantity: 4,
      ),
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: '5',
        quantity: 12,
      ),
    ];
    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
