import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          ListTile(
            title: Text("Dark Mode"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: Text("Notifications"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
        ],
      ),
    );
  }
}