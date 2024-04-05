import 'package:checkout_payment/core/errors/failure.dart';
import 'package:checkout_payment/core/utils/stripe_service.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
