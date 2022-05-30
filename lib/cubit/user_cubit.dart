import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oudarticle/models/user_model.dart';
import 'package:oudarticle/services/user_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void register({
    required String name,
    required String email,
    required String phone_number
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().register(
      name: name,
      email: email,
      phone_number: phone_number
    );
    emit(UserSuccess(user));
  }
}
