import 'package:checkout_payment/core/utils/api_service.dart';
import 'package:checkout_payment/core/utils/stripe_keys.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'const.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.postData(
        url: stripeUrl, token: StripeKeys.stripeSecretKey, body: paymentIntentInputModel);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }
}
