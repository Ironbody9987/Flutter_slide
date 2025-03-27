import 'package:app2/subLesson1/ButtonPage.dart';
import 'package:app2/subLesson1/ListViewPage.dart';
import 'package:app2/subLesson1/TextFieldPage.dart';
import 'package:app2/subLesson1/TextPage.dart';
import 'package:flutter/material.dart';

List itm = [TextPage(), TextFieldPage(), ButtonPage(), ListViewPage()];
List<String> titles = [
  "TextPage",
  "TextFieldPage",
  "ButtonPage",
  "ListViewPage",
];

class subchapter1 extends StatefulWidget {
  const subchapter1({super.key});

  @override
  State<subchapter1> createState() => _subchapter1State();
}

class _subchapter1State extends State<subchapter1> {
  void selectPage(int idx) {
    setState(() {
      if (idx < itm.length) {
        MaterialPageRoute route = MaterialPageRoute(builder: (c) => itm[idx]);
        Navigator.of(context).push(route);
      }
    });
  }

  IconData getIcon(int idx) {
    // Return a different icon based on the index
    switch (idx) {
      case 0:
        return Icons.text_fields; // TextField
      case 1:
        return Icons.edit; // TextPage
      case 2:
        return Icons.touch_app; // ButtonPage
      case 3:
        return Icons.view_list; // ListViewPage
      default:
        return Icons.book; // Default icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ບົດທີ 1 Grid view")),

      body: Container(
        margin: EdgeInsets.all(5),

        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (c, idx) {
            return InkWell(
              onTap: () {
                selectPage(idx);
              },
              child: Card(
                elevation: 15,
                child: Container(
                  width: 100,
                  height: 180,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 198, 28, 28),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 227, 53),
                      width: 5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        getIcon(idx), // Set icon dynamically
                        color: const Color.fromARGB(255, 212, 254, 0),
                        size: 80,
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      Text(
                        titles[idx],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
