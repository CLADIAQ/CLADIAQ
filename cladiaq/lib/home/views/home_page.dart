import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/commons/widgets/cq_icon_button.dart';
import 'package:cladiaq/device_data/bloc/device_data_bloc.dart';
import 'package:cladiaq/device_data/bloc/device_data_state.dart';
import 'package:flutter/material.dart';
import 'package:cladiaq/commons/widgets/cq_app_bar.dart';
import 'package:cladiaq/commons/widgets/cq_buttomn_nav_bar.dart';
import 'package:cladiaq/home/widgets/bar_chart_widget.dart';
import 'package:cladiaq/home/widgets/line_chart_widget.dart';
import 'package:cladiaq/home/widgets/map_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CqAppBar(hasNotifications: true, title: "Hello, Serah!"),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent, // Set the body color to transparent
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CqIconButton(
                                icon: "assets/icons/gas.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                disabled: false,
                                icon: "assets/icons/temperature.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                icon: "assets/icons/humidity.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                icon: "assets/icons/ap.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                icon: "assets/icons/LI.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                icon: "assets/icons/DB.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                icon: "assets/icons/PPM.svg",
                                onPressedCq: () {}),
                            horizontalSpaceMedium,
                            CqIconButton(
                                icon: "assets/icons/All.svg",
                                onPressedCq: () {}),
                            CqIconButton(
                                disabled: false,
                                icon: "assets/icons/filt.svg",
                                onPressedCq: () {})
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      BlocBuilder<DeviceDataBloc, DeviceDataState>(
                        builder: (context, state) {
                          if (state is DeviceDataLoaded) {
                            // final List<double> temp = state.deviceData
                            //     .map((data) => data.temperature!)
                            //     .toList();
                            // final List<String> time = state.deviceData
                            //     .map((data) => data.deviceId.toString())
                            //     .toList();
                            return LineChartWidget(
                              sensorDataList: state.deviceData,
                            );
                          } else
                            return Container();
                        },
                      ),
                      verticalSpaceSmall,
                      BarChartWidget(),
                      verticalSpaceSmall,
                      MapWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // const Positioned(bottom: 4, left: 35, child: CqButtomnNavBar())
        ],
      ),
      bottomNavigationBar: const CqButtomnNavBar(),
    );
  }
}
