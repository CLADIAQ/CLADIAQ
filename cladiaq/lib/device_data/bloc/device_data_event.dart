abstract class DeviceDataEvent {}

class FetchDeviceData extends DeviceDataEvent {
  final String token;

  FetchDeviceData(this.token);
}
