import 'package:app2/MenuDrawer.dart';
import 'package:app2/SettingsScreen.dart';
import 'package:flutter/material.dart';

class Drawer_Menu extends StatefulWidget {
  const Drawer_Menu({super.key});

  @override
  State<Drawer_Menu> createState() => _Drawer_MenuState();
}

class _Drawer_MenuState extends State<Drawer_Menu> {
  Widget popupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder:
          (c) => [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey.shade600,
                  size: 35,
                ),
                title: Text(
                  'ການຕັ້ງຄ່າ',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
              ),
            ),
            PopupMenuDivider(height: 20),

            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.wifi_outlined,
                  color: Colors.grey.shade600,
                  size: 35,
                ),
                title: Text(
                  'ເຊື່ອມຕໍ່ Wifi',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            PopupMenuDivider(height: 20),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(
                  Icons.folder,
                  color: Colors.yellow.shade600,
                  size: 35,
                ),
                title: Text(
                  'ເຊື່ອມຕໍ່ຖານຂໍ້ມູນ',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ບົດຮຽນພັດທະນາເເອັບດ້ວຍ Flutter1"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          popupMenuButton(),
        ],
      ),

      drawer: const MenuDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Modern.png"), // ใส่พาธของรูปภาพ
            fit: BoxFit.cover, // ปรับขนาดให้เต็มหน้าจอ
          ),
        ),
        child: const Center(
          child: Text(
            "ເນື້ອຫາຂອງໜ້ານີ້",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white, // เปลี่ยนสีตัวอักษรให้เห็นชัดเจน
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
