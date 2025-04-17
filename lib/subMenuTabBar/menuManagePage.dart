import 'package:app2/subManage/customer_page.dart';
import 'package:app2/subManage/employee_page.dart';
import 'package:app2/subManage/exchange_rate_page.dart';
import 'package:app2/subManage/product_info_page.dart';
import 'package:app2/subManage/product_type_page.dart';
import 'package:app2/subManage/supplier_page.dart';
import 'package:app2/subManage/unit_page.dart';
import 'package:flutter/material.dart';


class MenuManagePage extends StatefulWidget {
  const MenuManagePage({super.key});

  @override
  State<MenuManagePage> createState() => _MenuManagePageState();
}

class _MenuManagePageState extends State<MenuManagePage> {
  final List<String> items = [
    'ຫົວໜ່ວຍ',
    'ປະເພດສິນຄ້າ',
    'ຂໍ້ມູນສິນຄ້າ',
    'ຜູ້ສະໜອງ',
    'ພະນັກງານ',
    'ອັດຕາເເລກປ່ຽນ',
    'ລູກຄ້າ'
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
            title: Text(items[index], style: const TextStyle(fontSize: 18)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const UnitPage()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProductTypePage()));
                  break;
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProductInfoPage()));
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SupplierPage()));
                  break;
                case 4:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const EmployeePage()));
                  break;
                case 5:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ExchangeRatePage()));
                  break;
                case 6:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CustomerPage()));
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
