import 'package:app2/subchapter1.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/soutsaka.png",
                ), // เปลี่ยนเป็นภาพของคุณ
                fit: BoxFit.cover, // ปรับให้รูปเต็มพื้นที่
              ),
            ),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent, // ให้พื้นหลังโปร่งใส
              ),
              accountName: const Text(
                "BCSP6B STORE",
                style: TextStyle(color: Colors.white), // เปลี่ยนสีตัวหนังสือ
              ),
              accountEmail: const Text(
                "02092267544",
                style: TextStyle(color: Colors.white), // เปลี่ยนสีตัวหนังสือ
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("images/me.jpg"),
              ),
            ),
          ),
          ...List.generate(9, (index) {
            return Card(
              elevation: 8,
              shadowColor: const Color.fromARGB(255, 249, 31, 31),
              child: ListTile(
                title: Text(
                  "ບົດທີ ${index + 1}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 13, 168, 224),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const Icon(
                  Icons.book,
                  color: Color.fromARGB(255, 13, 168, 224),
                  size: 25,
                ),
                onTap: () {
                  //  Navigator.of(context).pop();
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (c) => subchapter1(),
                  ); // ปิด Drawer
                  Navigator.of(context).push(route);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
