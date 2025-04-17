import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // รายการสินค้า
  List<String> products = [
    'ບິກ',
    'ສໍ',
    'ບັນທັດ',
    'ເຈ້ຍ',
    'ສໍສີ',
    'ປຶ້ມ',
  ];

  // ค่าที่กรอกใน TextField
  String query = '';

  @override
  Widget build(BuildContext context) {
    // ฟังก์ชั่นกรองรายการสินค้าตามคำค้นหา
    List<String> filteredProducts = products
        .where((product) => product.contains(query))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ຄົ້ນຫາສິນຄ້າ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // TextField สำหรับค้นหาสินค้า
            TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'ຄົ້ນຫາ',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // หากไม่มีผลลัพธ์จะแสดงข้อความว่าไม่พบสินค้า
            if (filteredProducts.isEmpty)
              const Center(child: Text('ບໍ່ມີສິນຄ້າທີ່ຕົກງານ')),
            // แสดงรายการสินค้าที่ค้นพบ
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredProducts[index]),
                    leading: const Icon(Icons.shopping_cart),
                    onTap: () {
                      // ทำการเลือกสินค้าหรือกระทำการอื่น ๆ ตามต้องการ
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('ເລືອກ: ${filteredProducts[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
