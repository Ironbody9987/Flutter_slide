import 'package:flutter/material.dart';

class subchapter1 extends StatefulWidget {
  const subchapter1({super.key});

  @override
  State<subchapter1> createState() => _subchapter1State();
}

class _subchapter1State extends State<subchapter1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ບົດທີ 1 Grid view")),

      body: Container(
        margin: EdgeInsets.all(5),

        child: GridView.builder(
          itemCount: 15,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (c, idx) {
            return Card(
              elevation: 15,
              child: Container(
                width: 100,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 198, 28, 28),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.book,
                      color: const Color.fromARGB(255, 212, 254, 0),
                      size: 80,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    Text(
                      "ບົດທີ 1.${idx + 1}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
