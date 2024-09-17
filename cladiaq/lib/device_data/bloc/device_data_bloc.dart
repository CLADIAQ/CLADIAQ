// blocs/device_data/device_data_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:cladiaq/device_data/services/device_data_service.dart';
import 'device_data_event.dart';
import 'device_data_state.dart';

class DeviceDataBloc extends Bloc<DeviceDataEvent, DeviceDataState> {
  final DeviceDataService deviceDataService;

  DeviceDataBloc(this.deviceDataService) : super(DeviceDataInitial()) {
    on<FetchDeviceData>((event, emit) async {
      emit(DeviceDataLoading());
      try {
        final data = await deviceDataService.fetchDeviceData(event.token);
        emit(DeviceDataLoaded(data));
      } catch (e) {
        emit(DeviceDataError(e.toString()));
      }
    });
  }
}
