import 'package:dars49/view_models/viewmodel.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  Function refresh;
  SettingsScreen({super.key, required this.refresh});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Viewmodel vm = Viewmodel();

  bool newValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(vm.model.isDark ? Icons.dark_mode : Icons.light_mode, size: 100),
          Switch(
            value: vm.model.isDark,
            onChanged: (value) {
              setState(() {
                vm.themeUpdate();
                widget.refresh();
              });
            },
          ),
        ],
      ),
    );
  }
}
