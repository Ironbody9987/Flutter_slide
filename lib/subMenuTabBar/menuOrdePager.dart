import 'package:flutter/material.dart';

class MenuOrderPager extends StatefulWidget {
  const MenuOrderPager({super.key});

  @override
  State<MenuOrderPager> createState() => _MenuOrderPagerState();
}

class _MenuOrderPagerState extends State<MenuOrderPager> {
  List<String> products = [
    'ກວດສອບສິນຄ້າ',
    'ສັ່ງຊື້ສິນຄ້າ',
    'ປະຫວັດການສັ່ງຊື້ສິນຄ້າ',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ສັ່ງຊື້ສິນຄ້າ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // จำนวน column
          crossAxisSpacing: 10, // ระยะห่างแนวนอน
          mainAxisSpacing: 10, // ระยะห่างแนวตั้ง
          children: List.generate(products.length, (index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('ເລືອກ: ${products[index]}')),
                );
              },
              child: Card(
                color: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart,
                        size: 40, color: Colors.blue.shade900),
                    const SizedBox(height: 10),
                    Text(
                      products[index],
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
