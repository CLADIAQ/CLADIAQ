abstract class DeviceDataState {}

class DeviceDataInitial extends DeviceDataState {}

class DeviceDataLoading extends DeviceDataState {}

class DeviceDataLoaded extends DeviceDataState {
  final List<dynamic> deviceData; // Adjust the type as necessary

  DeviceDataLoaded(this.deviceData);
}

class DeviceDataError extends DeviceDataState {
  final String error;

  DeviceDataError(this.error);
}
