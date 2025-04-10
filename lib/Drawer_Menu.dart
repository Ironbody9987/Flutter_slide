import 'package:app2/subMenuTabBar/importPage.dart';
import 'package:app2/subMenuTabBar/menuManagePage.dart';
import 'package:app2/subMenuTabBar/menuOrdePager.dart';
import 'package:app2/subMenuTabBar/reportPage.dart';
import 'package:app2/subMenuTabBar/salePage.dart';

import 'package:app2/subMenuTabBar/searchPage.dart';

import 'package:flutter/material.dart';
import 'package:app2/MenuDrawer.dart';
import 'package:app2/SettingsScreen.dart';

class Drawer_Menu extends StatefulWidget {
  const Drawer_Menu({super.key});

  @override
  State<Drawer_Menu> createState() => _Drawer_MenuState();
}

class _Drawer_MenuState extends State<Drawer_Menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ບົດຮຽນພັດທະນາເເອັບດ້ວຍ Flutter1"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            popupMenuButton(),
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.yellow, // Text color for selected tab
            unselectedLabelColor: Colors.white, // Text color for unselected tab
            tabs: [
              Tab(
                icon: Icon(Icons.folder_open, size: 25),
                text: "ຈັດການຂໍ້ມູນພື້ນຖານ",
              ),
              Tab(icon: Icon(Icons.shopping_basket, size: 25), text: "ຂາຍ"),
              Tab(
                icon: Icon(Icons.arrow_back, size: 25),
                text: "ສັ່ງຊື້ສິນຄ້າ",
              ),
              Tab(
                icon: Icon(Icons.arrow_forward, size: 25),
                text: "ນຳເຂົ້າສິນຄ້າ",
              ),
              Tab(icon: Icon(Icons.bar_chart, size: 25), text: "ຄົ້ນຫາ"),
              Tab(icon: Icon(Icons.report, size: 25), text: "ລາຍງານ"),
            ],
          ),
        ),
        drawer: const MenuDrawer(),
        body: TabBarView(
          children: [
            menuManagePage(),
            SalePage(),
            MenuOrderPager(),
            ImportPage(),
            SearchPage(),
            ReportPage()
          
          ],
        ),
      ),
    );
  }

  Widget popupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.settings, color: Colors.grey.shade600, size: 35),
            title: Text('ການຕັ້ງຄ່າ',
                style: TextStyle(color: Colors.blue.shade600, fontSize: 20)),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              });
            },
          ),
        ),
        const PopupMenuDivider(height: 20),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.wifi_outlined,
                color: Colors.grey.shade600, size: 35),
            title: Text('ເຊື່ອມຕໍ່ Wifi',
                style: TextStyle(color: Colors.blue.shade600, fontSize: 20)),
            onTap: () {
              Navigator.of(context).pop();
              // Future.delayed(Duration.zero, () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => YourWifiPage()));
              // });
            },
          ),
        ),
        const PopupMenuDivider(height: 20),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.folder,
                color: Colors.yellow.shade600, size: 35),
            title: Text('ເຊື່ອມຕໍ່ຖານຂໍ້ມູນ',
                style: TextStyle(color: Colors.blue.shade600, fontSize: 20)),
            onTap: () {
              Navigator.of(context).pop();
              // Future.delayed(Duration.zero, () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => YourDatabasePage()));
              // });
            },
          ),
        ),
      ],
    );
  }
}
