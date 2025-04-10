import 'package:flutter/material.dart';

class menuManagePage extends StatefulWidget {
  const menuManagePage({super.key});

  @override
  State<menuManagePage> createState() => _menuManagePageState();
}

class _menuManagePageState extends State<menuManagePage> {
  // ข้อมูล List ตัวอย่าง
  final List<String> items = [
    'ສິນຄ້າ',
    'ປະເພດສິນຄ້າ',
    'ຫົວໜ່ວຍສິນຄ້າ',
    'ຜູ້ຈັດຈໍາໜ່າຍ',
    'ລູກຄ້າ',
    'ຜູ້ຂາຍ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຈັດການຂໍ້ມູນພື້ນຖານ"),
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.folder, color: Colors.blue.shade400),
            title: Text(items[index],
                style: const TextStyle(fontSize: 18)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('ຄຸນເລືອກ: ${items[index]}')),
              );
            },
          );
        },
      ),
    );
  }
} 