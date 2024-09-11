import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/commons/ui_helpers.dart';
import 'package:cladiaq/settings/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight(context) * 0.53,
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: Colors.white),
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: ListTile(
                    leading: item.leadingIcon,
                    title: Text(item.text),
                    trailing: SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      height: 17,
                      width: 17,
                    ),
                    onTap: () {
                      // Handle item tap
                      print('${item.text} tapped');
                    },
                  ),
                );
              },
            ),
          ),
          // const Divider(
          //   color: Colors.grey,
          //   height: 1,
          // )
        ],
      ),
    );
  }
}
