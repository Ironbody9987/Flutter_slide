import 'package:app2/MenuDrawer.dart';
import 'package:flutter/material.dart';

class Drawer_Menu extends StatefulWidget {
  const Drawer_Menu({super.key});

  @override
  State<Drawer_Menu> createState() => _Drawer_MenuState();
}

class _Drawer_MenuState extends State<Drawer_Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ບົດຮຽນພັດທະນາເເອັບດ້ວຍ Flutter1")),
      drawer: MenuDrawer(),
    );
  }
}
