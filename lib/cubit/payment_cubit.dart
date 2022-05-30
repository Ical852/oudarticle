import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oudarticle/models/payment_model.dart';
import 'package:oudarticle/services/payment_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void transaction({
    required String order_id,
    required String gross_amount,
    required int user_id,
    required int article_id
  }) async {
    emit(PaymentLoading());
    PaymentModel payment = await PaymentService().transaction(
      order_id: order_id,
      gross_amount: gross_amount,
      user_id: user_id,
      article_id: article_id
    );
    emit(PaymentSuccess(payment));
  }
}
