import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ຂໍ້ມູນສິນຄ້າ")),
      body: const Center(child: Text("ໜ້າຂໍ້ມູນສິນຄ້າ")),
    );
  }
}
