import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/payment_intent_input_model.dart';
import '../../../repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CheckoutRepo checkoutRepo;

  PaymentCubit({required this.checkoutRepo}) : super(PaymentInitialState());

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoadingState());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
        (failure) =>
            emit(PaymentFailureState(errorMessage: failure.errorMessage)),
        (success) => emit(PaymentSuccessState()));
  }
  @override
  void onChange(Change<PaymentState> change) {
   log(change.toString());
    super.onChange(change);
  }
}
