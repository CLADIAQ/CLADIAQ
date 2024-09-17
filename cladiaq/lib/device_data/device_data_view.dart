// screens/home/home_view.dart
import 'package:cladiaq/commons/data/services/authentication_service.dart';
import 'package:cladiaq/device_data/bloc/device_data_bloc.dart';
import 'package:cladiaq/device_data/bloc/device_data_event.dart';
import 'package:cladiaq/device_data/bloc/device_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import your AuthenticationService

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the AuthenticationService to get the token
    final authService = context.read<AuthenticationService>();
    final token =
        authService.getToken(); // Ensure this method returns the current token

    // Dispatch the event to fetch device data
    context.read<DeviceDataBloc>().add(FetchDeviceData(token as String));

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<DeviceDataBloc, DeviceDataState>(
        builder: (context, state) {
          if (state is DeviceDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DeviceDataLoaded) {
            return ListView.builder(
              itemCount: state.deviceData.length,
              itemBuilder: (context, index) {
                final device = state
                    .deviceData[index]; // Adjust based on your data structure
                return ListTile(
                  title: Text(
                      'Device: ${device['name']}'), // Adjust based on your data structure
                  subtitle: Text(
                      'Status: ${device['status']}'), // Adjust based on your data structure
                );
              },
            );
          } else if (state is DeviceDataError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
