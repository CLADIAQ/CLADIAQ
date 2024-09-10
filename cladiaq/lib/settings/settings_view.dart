import 'package:cladiaq/settings/settings_list.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) =>
          Divider(height: 1, color: Colors.grey),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          height: 68,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: ListTile(
            leading: Icon(item.leadingIcon),
            title: Text(item.text),
            trailing: Icon(item.trailingIcon),
            onTap: () {
              // Handle item tap
              print('${item.text} tapped');
            },
          ),
        );
      },
    );
  }
}
