import 'package:flutter/material.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'ສິນຄ້າ 1',
      'price': 100.0,
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'ສິນຄ້າ 2',
      'price': 200.0,
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'ສິນຄ້າ 3',
      'price': 300.0,
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຂາຍສິນຄ້າ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Image.network(
                  product['image'] as String,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                ),
                title: Text(
                  product['name'] as String,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'ລາຄາ: ${product['price']} ກີບ',
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ຄຸນເລືອກ: ${product['name']}')),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
