import 'package:checkout_payment/core/utils/api_service.dart';
import 'package:checkout_payment/core/utils/stripe_keys.dart';
import 'package:checkout_payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'const.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.postData(
      url: stripeUrl,
      token: StripeKeys.stripeSecretKey,
      body: paymentIntentInputModel.toJson(),
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  // Future<PaymentIntentModel> createCustomerId(
  //     {required PaymentIntentInputModel paymentIntentInputModel}) async {
  //   var response = await apiService.postData(
  //     url: stripeCustomerUrl,
  //     token: StripeKeys.stripeSecretKey,
  //     body: paymentIntentInputModel.toJson(),
  //   );
  //
  //   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
  //
  //   return paymentIntentModel;
  // }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
          merchantDisplayName: 'Ahmed Belal',
          customerEphemeralKeySecret:
              initPaymentSheetInputModel.ephemeralKeySecret,
          customerId: initPaymentSheetInputModel.customerId),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {
    required String customerId,
  }) async {
    var response = await apiService.postData(
      url: stripeEphemeralKeyUrl,
      body: {'customer': customerId},
      headers: {
       'Authorization': "Bearer ${StripeKeys.stripeSecretKey}" ,
        'Stripe-Version': '2023-10-16',

      },
    );

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {

    var paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);

    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );

    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }
}
