import 'package:flutter/material.dart';

class ExchangeRatePage extends StatefulWidget {
  const ExchangeRatePage({super.key});

  @override
  State<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ອັດຕາເເລກປ່ຽນ")),
      body: const Center(child: Text("ໜ້າອັດຕາເເລກປ່ຽນ")),
    );
  }
}
