import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      emit(HomeHomeState());
    });

    on<HomeStartEvent>((event, emit) {
      emit(HomeHomeState());
    });
    on<AtmButtonClickedEvent>((event, emit) {
      print("I have been clickced");
      emit(HomeAtmState());
    });
    on<GasButtonClickedEvent>((event, emit) {
      emit(HomeGasState());
    });
    on<LiveButtonClickedEvent>((event, emit) {
      emit(HomeLiveState());
    });
  }
}
