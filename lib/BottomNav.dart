// Bottom Navigation Bar
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home,
                color: currentIndex == 0 ? Colors.green : Colors.grey),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(Icons.search,
                color: currentIndex == 1 ? Colors.green : Colors.grey),
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border,
                color: currentIndex == 2 ? Colors.green : Colors.grey),
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(Icons.person,
                color: currentIndex == 3 ? Colors.green : Colors.grey),
            onPressed: () {
              onTap(3);
            },
          ),
        ],
      ),
    );
  }
}
