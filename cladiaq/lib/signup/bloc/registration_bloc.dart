// blocs/authentication/registration_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:cladiaq/commons/data/services/authentication_service.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthenticationService authenticationService;

  RegistrationBloc(this.authenticationService) : super(RegistrationInitial()) {
    on<RegistrationButtonPressed>((event, emit) async {
      emit(RegistrationLoading());
      try {
        await authenticationService.register(
            event.fullName, event.email, event.password);
        emit(RegistrationSuccess());
      } catch (e) {
        emit(RegistrationFailure(error: e.toString()));
      }
    });
  }
}
