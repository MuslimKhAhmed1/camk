import 'package:camk/ArticleScreen.dart';
import 'package:camk/Controller/ModeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailArticlePage extends StatelessWidget {
  final Articles article;

  const DetailArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ناوەرۆکی بابەت",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  themeProvider.toggleFavorate();
                },
                icon: Icon(
                  themeProvider.isfaved ? Icons.bookmark_add : Icons.bookmark,
                  color: Theme.of(context).iconTheme.color,
                )),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.share),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Text(
                  article.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "${article.author} - ${article.date}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  article.imgUrl,
                  width: double.infinity,
                ),
                const SizedBox(height: 16),
                Text(
                  article.detail,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${article.likes} بەدلبوون",
                      style: const TextStyle(color: Colors.orangeAccent),
                    ),
                    Text(
                      "${article.comments} کۆمێنت",
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Divider(color: isDarkMode ? Colors.grey : Colors.black12),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    maxLines: 1,
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'نوسینی ڕا',
                      labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black87),
                      filled: true,
                      fillColor:
                          isDarkMode ? Colors.grey[850] : Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add comment functionality
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(380, 30),
                      backgroundColor:
                          isDarkMode ? Colors.grey[800] : Colors.blue,
                    ),
                    child: Text(
                      'ناردنی ڕا',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
