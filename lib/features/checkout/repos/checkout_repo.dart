import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}
