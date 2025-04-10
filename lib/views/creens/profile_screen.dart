import 'package:dars49/view_models/viewmodel.dart';
import 'package:dars49/views/widgets/show_dialog_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Viewmodel vm = Viewmodel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  vm.model.image,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "${vm.model.name} ${vm.model.lastName}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  vm.model.phoneNumber,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color:
                        vm.model.isDark
                            ? Colors.white.withValues(alpha: 0.5)
                            : Colors.black.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(vm.model.bio, style: TextStyle(fontSize: 13)),
                ),
              ],
            ),
            IconButton(
              onPressed:
                  () => showDialog(
                    context: context,
                    builder:
                        (context) => EditDialog(
                          vm: vm,
                          refresh: () {
                            setState(() {});
                          },
                        ),
                  ),
              icon: Icon(Icons.edit, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
