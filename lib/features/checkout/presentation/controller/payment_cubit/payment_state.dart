part of 'payment_cubit.dart';

@immutable
abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadingState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {}

class PaymentFailureState extends PaymentStates {
  final String errorMessage;

  PaymentFailureState({required this.errorMessage});
}
