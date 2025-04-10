import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function(int) onTabTapped;
  final int selectedIndex;

  const BottomBar({super.key, required this.onTabTapped, required this.selectedIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onTabTapped,
      type: BottomNavigationBarType.fixed, // Keep all icons visible
      selectedItemColor: Colors.blue, // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
      showUnselectedLabels: true, // Show labels for all items
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
      ],
    );
  }
}
