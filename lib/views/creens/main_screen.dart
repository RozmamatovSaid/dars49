import 'package:dars49/view_models/viewmodel.dart';
import 'package:dars49/views/creens/home_screen.dart';
import 'package:dars49/views/creens/profile_screen.dart';
import 'package:dars49/views/creens/settings_screen.dart';
import 'package:dars49/views/widgets/app_bar_widget.dart';
import 'package:dars49/views/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  Function refresh;
  MainScreen({super.key, required this.refresh});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Viewmodel vm = Viewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: vm.pageController,
        children: [
          HomeScreen(),
          ProfileScreen(),
          SettingsScreen(
            refresh: () {
              widget.refresh();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
