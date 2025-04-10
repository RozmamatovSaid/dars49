import 'package:dars49/view_models/viewmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Viewmodel vm = Viewmodel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vm.uzbekistanFacts.length,
      itemBuilder:
          (context, index) => Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: 300,
            decoration: BoxDecoration(
              color: Colors.brown.shade400,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              vm.uzbekistanFacts[index],
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
    );
  }
}
