import 'package:flutter/material.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({super.key});

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {
  // ข้อมูลสินค้าที่จะแสดงใน Grid
  List<String> products = [
    'ກວດສອບສິນຄ້າ',
    'ນຳເຂົ້າສິນຄ້າ',
    'ປະຫວັດການສັ່ງຊື້ສິນຄ້າ',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ນຳເຂົ້າສິນຄ້າ"),
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
                  SnackBar(content: Text('ຄຸນເລືອກ: ${products[index]}')),
                );
              },
              child: Card(
                color: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart,
                        size: 40, color: Colors.green.shade400),
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
