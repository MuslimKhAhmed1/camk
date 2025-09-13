import 'package:camk/BottomNav.dart';
import 'package:camk/Controller/ModeProvider.dart';
import 'package:camk/SignIn_page.dart';
import 'package:camk/Tabs.dart';
import 'package:camk/top_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Bottom navigation index

  final List<Widget> _bottomNavPages = [
    TabScreen(), // Home Page
    Center(
        child: Container(
      child: Column(
        children: [
          // CustomTextField(controller: ,)
        ],
      ),
    )),
    Center(child: Text("Bookmarks Page", style: TextStyle(fontSize: 20))),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: Icon(
            Icons.library_books_outlined,
          ),
          title: const Text(
            "چەمک",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.security, color: Colors.amber[700]),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopActiveUsersPage(),
                    ));
              },
            ),
            IconButton(
              icon: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
          elevation: 0,
        ),
        body: _bottomNavPages[selectedIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 66, left: 10),
          child: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("بابەتی نوێ")),
              );
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.edit, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                )),
            icon: Icon(Icons.login)));
  }
}
