import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/feature/login/domain/entities/login.dart';
import 'package:houses/feature/login/domain/models/login_model.dart';
import 'package:houses/feature/login/domain/usecases/login_usecase.dart';
import 'package:houses/presentation/login/login_event.dart';
import 'package:houses/presentation/login/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginAttemptEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await loginUseCase.login(LoginModel(event.email, event.password));
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
