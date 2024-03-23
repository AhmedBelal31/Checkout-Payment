import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title;
  final String price;

  const OrderInfoItem({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title , style: AppStyles.style18,),
        const Spacer(),
        Text('$price\$',style: AppStyles.style18,),
      ],
    );
  }
}




// class OrderInfoItem extends StatelessWidget {
//   final OrderInfoModel orderInfoModel;
//
//   const OrderInfoItem({
//     super.key,
//     required this.orderInfoModel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(orderInfoModel.orderInfoText , style: AppStyles.style18,),
//         const Spacer(),
//         Text('\&${orderInfoModel.orderInfoPrice}',style: AppStyles.style18,),
//       ],
//     );
//   }
// }

// class OrderInfoModel {
//   final String orderInfoText;
//
//   final String orderInfoPrice;
//
//   const OrderInfoModel({
//     required this.orderInfoText,
//     required this.orderInfoPrice,
//   });
// }
//
// List<OrderInfoModel> orderInfoItems = const [
//   OrderInfoModel(
//     orderInfoText: 'Order Subtotal ',
//     orderInfoPrice: '42.97',
//   ),
//   OrderInfoModel(
//     orderInfoText: 'Discount',
//     orderInfoPrice: '0',
//   ),
//   OrderInfoModel(
//     orderInfoText: 'Shipping',
//     orderInfoPrice: '8',
//   ),
// ];
