import 'package:flutter/material.dart';

class ProductTypePage extends StatefulWidget {
  const ProductTypePage({super.key});

  @override
  State<ProductTypePage> createState() => _ProductTypePageState();
}

class _ProductTypePageState extends State<ProductTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ປະເພດສິນຄ້າ")),
      body: const Center(child: Text("ໜ້າປະເພດສິນຄ້າ")),
    );
  }
}
