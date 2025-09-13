//Tab Screen with TabBar
import 'package:camk/ArticleScreen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBarSection(),
          Expanded(
            child: TabBarView(
              children: [
                ArticlesListScreen(category: "بۆ تۆ"),
                ArticlesListScreen(category: "فۆلۆەکان"),
                ArticlesListScreen(category: "زانستی"),
                ArticlesListScreen(category: "تەکنەلۆژیا"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Tab Bar Section
class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const TabBar(
        isScrollable: true,
        indicatorColor: Colors.green,
        labelColor: Colors.green,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(text: "بۆ تۆ"),
          Tab(text: "فۆلۆەکان"),
          Tab(text: "زانستی"),
          Tab(text: "تەکنەلۆژیا"),
        ],
      ),
    );
  }
}
