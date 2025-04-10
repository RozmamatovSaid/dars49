import 'package:dars49/view_models/viewmodel.dart';
import 'package:dars49/views/widgets/IconButtonItem.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  BottomNavBarWidget({super.key});
  Viewmodel vm = Viewmodel();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Iconbuttonitem(
            onPressed: () => vm.jumpToPage(0),
            icon: Icons.home_filled,
          ),
          Iconbuttonitem(onPressed: () => vm.jumpToPage(1), icon: Icons.person),
          Iconbuttonitem(
            onPressed: () => vm.jumpToPage(2),
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
