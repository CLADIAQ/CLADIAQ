import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/commons/widgets/cq_app_bar.dart';
import 'package:cladiaq/commons/widgets/cq_buttomn_nav_bar.dart';
import 'package:cladiaq/commons/widgets/cq_profile_img.dart';
import 'package:cladiaq/settings/settings_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CqAppBar(hasNotifications: true, title: "Hello, Serah!"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpaceLarge,
            const CqProfileImg(),
            const Text("Home Screen"),
            SizedBox(height: screenHeight(context) * 0.6, child: SettingsView())
          ],
        ),
      ),
      bottomNavigationBar: CqButtomnNavBar(),
    ));
  }
}
