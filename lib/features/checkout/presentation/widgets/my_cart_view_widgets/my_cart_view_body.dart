import 'package:checkout_payment/features/checkout/presentation/controller/payment_cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/widgets/my_cart_view_widgets/total_price.dart';
import 'package:checkout_payment/features/checkout/repos/checkout_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_button.dart';
import '../payment_details_view_widgets/payment_methods_bottom_sheet.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(
            child: Image.asset('assets/images/basket_image.png'),
          ),
          const SizedBox(height: 25),
          // SizedBox(
          //   height: 400,
          //   child: ListView.builder(
          //     itemBuilder:(context, index) => OrderInfoItem(
          //       orderInfoModel: orderInfoItems[index],
          //     ),
          //     itemCount: orderInfoItems.length,
          //   ),
          // )
          const OrderInfoItem(
            title: 'Order Subtotal ',
            price: '42.97',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Discount',
            price: '0',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Shipping ',
            price: '8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: 'Total ',
            price: '50,97',
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonText: 'Complete Payment',
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider(
                  create: (context) =>
                      PaymentCubit(checkoutRepo: CheckoutRepoImpl()),
                  child: const PaymentMethodsBottomSheet(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
