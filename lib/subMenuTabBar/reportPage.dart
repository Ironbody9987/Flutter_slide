import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // ข้อมูลรายงานที่ใช้ในการแสดง
  List<Map<String, String>> reports = [
    {
      'title': 'ລາຍງານການສັ່ງຊື້',
      'date': '2025-04-10',
      'amount': '100,000 ກີບ',
    },
    {
      'title': 'ລາຍງານການນຳເຂົ້າ',
      'date': '2025-04-09',
      'amount': '50,000 ກີບ',
    },
    {
      'title': 'ລາຍງານການຂາຍ',
      'date': '2025-04-08',
      'amount': '75,000 ກີບ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ລາຍງານ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  reports[index]['title']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ວັນທີ: ${reports[index]['date']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'ຈຳນວນ: ${reports[index]['amount']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    // ทำการแสดงรายละเอียดของรายงาน
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ກຳລັງອັບເດດ: ${reports[index]['title']}')),
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
