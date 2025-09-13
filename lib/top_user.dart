import 'dart:math';

import 'package:camk/Controller/ModeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopActiveUsersPage extends StatelessWidget {
  final List<String> users = [
    "کاروان",
    "دڵشاد",
    "شیراز",
    "خەڵات",
    "زەمەن",
    "ژیار",
    "ئەحمەد",
    "ڕێوان",
    "لارا",
    "ئارام"
  ];

  final List<int> points = List.generate(10, (index) {
    int n = 1500;
    int s = Random().nextInt(15);
    index *= 150;
    index += s;
    return (n - (index));
  });

  TopActiveUsersPage({super.key}); // Random points for users

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ئەکتیڤترین بەکارهێنەرەکان',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            // final userName = users[index];
            // final score = points[index];
            IconData icon;
            Color iconColor;

            if (index == 0) {
              icon = Icons.star;
              iconColor = Colors.amber; // Gold
            } else if (index == 1) {
              icon = Icons.star;
              iconColor = const Color.fromARGB(255, 190, 176, 176)!; // Silver
            } else if (index == 2) {
              icon = Icons.star;
              iconColor = const Color.fromARGB(255, 128, 81, 64); // Copper
            } else {
              icon = Icons.person; // Default icon for others
              iconColor =
                  themeProvider.isDarkMode ? Colors.black : Colors.white;
            }

            return Card(
              elevation: 4.0,
              child: ListTile(
                leading: Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                ),
                title: Text(
                  users[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'خاڵ: ${points[index]}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'پلەی: ${index + 1}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
