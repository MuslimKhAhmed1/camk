import 'package:camk/DetailArticle.dart';
import 'package:flutter/material.dart';

class ArticlesListScreen extends StatelessWidget {
  const ArticlesListScreen({super.key, required String category});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("جوانترین بابەتەکان"),
        ),
        body: ListView.builder(
          itemCount: article.length,
          itemBuilder: (context, index) {
            final currentArticle = article[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the detail page when an article is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailArticlePage(article: currentArticle),
                  ),
                );
              },
              child: currentArticle.displayArticleCard(),
            );
          },
        ),
      ),
    );
  }
}

// Sample Articles List
class Articles {
  final String title;
  final String author;
  final String imgUrl;
  final int likes;
  final int comments;
  final String date;
  final String detail;
  final String type;

  Articles({
    required this.title,
    required this.author,
    required this.imgUrl,
    required this.likes,
    required this.comments,
    required this.date,
    required this.detail,
    required this.type,
  });

  Widget displayArticleCard() {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imgUrl,
              height: 40,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "لەلایەن: $author",
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  detail,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$likes بەدلبوون",
                      style: const TextStyle(color: Colors.orangeAccent),
                    ),
                    Text(
                      "$comments کۆمێنت",
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Articles> article = [
  Articles(
    title: "گەلەئەستێرە چیە؟",
    author: "ڕێباز کەریم",
    imgUrl: "assets/ga.jpg",
    likes: 120,
    comments: 45,
    date: "2024-12-20",
    detail:
        '''گەلەئەستێرە یان گالاکسی گەورەترین یەکەی گەردوونیە، لە کۆمەڵێکی ئێجگار زۆر لە ئەستێرەکان و هەسارەکانیان پێک دێت، لەگەڵ تانە هایدرۆجینیەکان nebula هەروەها لەگەڵ هەموو ئەو تەن و بارستانەی دەکەونە نێوان بۆشایی نێوان ئەستێرەکان بۆ نموونە کونە ڕەشەکان، بارستەی تاریک dark.matter کە تا ئێستا بەتەواوی نازانین چییە بەڵام هێزی کێشکردنی هەیە واتە شتێکە بوونی هەیە، ئەویش بەشێکە لە پێکهاتەی گەلەئەستێرەکان، هەموو ئەو پێکهاتانە بەیەکەوە بەهۆی هێزی کێشکردنی نێوانیان تۆپەڵ بوون بەیەکەوە و بارستەیەکی زۆر زۆر گەورەتر پێک دەهێنن کە پێی دەڵێین گەلەئەستێرە.
لە گەردووندا چەند گەلەئەستێرە هەیە؟
لە هەر کوێیەکی گەردوون بین و چاودێری گەردوون بکەین ئێمە ناتوانین هەموو گەردوون ببینین بەهۆی کشانی بۆشایی ئاسمان، گەردوون وەکو میزڵدانێکە بەردەوام زۆر زۆر بەخێرایی دەکشێت و گەورەتر دەبێت، بۆیە لەهەر کوێیەک بین لەنێو گەردوون وەکو ئەوە وایە لەنێو بڵقێکی گۆیی زۆر زۆر گەورە بین لە بۆشایی کە پڕە لە گەلەئەستێرە، ئێمەش تەنیا دەتوانین گەلەئەستێرەکانی نێو ئەو بڵقە گۆییە زۆر گەورەیە ببینین و چاودێری بکەین کە پێی دەڵێین گەردوونی بینراو، ئێستا دەزانین تەمەنی گەردوونی بینراو نزیکەی 13.8 ملیار ساڵە بەڵام لەوەتەی سەرەتای دروست بوونیەوە دوای تەقینەوە گەورەکە هەر بەردەوام لە کشان بووە، بۆیە لە ئێستادا تەنیا تیرەی گەردوونی بینراو بە نزیکەی 92 ملیار ساڵی تیشکی مەزەندە دەکرێت، لەبەر ئەوەی ناتوانین هەموو گەردوونیش ببینین بۆیە نازانین هەموو گەردوون و بوون چەندە گەورە و فراوانە، دەشێت هەر هەمووی بێ کۆتا بێت لە گەورەیی و فراوانی، لەو دۆخەدا گەردوونی بینراو تەنیا گیرفانێکی بچووکە لەنێو هەموو گەردوون یان لەنێو بوونێکی بێ کۆتا، ئەوساکە ئەگەری سەیر و سەمەرەتر دێتە ئاراوە کە لە نووسینێکی تردا باسی دەکەم''',
    type: "زانستی",
  ),
  Articles(
    title: "ChatGPT چۆن کار دەکات؟  ",
    author: "ئەحمەد شێرزاد",
    imgUrl: "assets/ch.jpg",
    likes: 85,
    comments: 30,
    date: "2024-11-15",
    detail:
        ''' لە ڕۆژگاری ئەمڕۆی تەکنەلۆژیادا بابەتی چات بۆتەکان و مۆدێلەکانی زمان* سەرنجی بەکارهێنەرانی ئینتەرنێتی ڕاکێشاوە بەتایبەت بەم دواییانە کە Chat GPT دەرکەوتووە.

چات جی پی تی (بە ئینگلیزی: Chat GPT، بە عەرەبی: تشات جي بي تي) کورتکراوەی گۆڕەری پێش-ڕاهێنراوی بەرهەمهێنە (Generative Pre-trained Transformer) مۆدێلێکی زمانە*، هاوشێوەی ئامڕازێکی چات کردن بەکاردێت و لەسەر کۆمەڵە داتایەکی زۆری ئینتەرنێت ڕاهێنراوە. ساڵی ٢٠١٨ کۆمپانیای (OpenAI) کە تایبەتە بە توێژینەوەی زیرەکی دەستکرد، یەکەم نەوەی GPTـی  بڵاوکردەوە و دواتر ٢ نەوەی تری بەدوادا هات کۆتا دانەی لە تشرینی دووەمی ٢٠٢٢ بوو، هەریەکەیان خاوەنی تایبەتمەندی باشتر لە نەوەی پێش خۆیانن. Chat GPT بۆ دروستکردنی نووسینی هاوشێوەی مرۆڤ داڕێژراوە و دەتوانرێت بۆ چەندین ئەرکی پرۆسێسکردنی زمان وەک وەرگێڕان، کورتکردنەوەی دەق و درووستکردنی گفتوگۆ بەکاربهێنرێت. ئەم چاتە دەتوانێت وەڵامی پرسیارەکان بداتەوە و لە ئەرکەکانی وەک ئامادەکردنی ئیمەیڵ و وتار و تەنانەت لە چارەسەر کردنی کێشەکانی پڕۆگرامسازیدا یارمەتیت بدات. لە ئێستادا بەکارهێنان بەخۆڕایی بۆ هەمووان بەردەستە چونکە لە قۆناغی توێژینەوە و کۆکردنەوەی فیدباکدایە.

Chat GPT چۆن کار دەکات؟
لە ڕووکەشدا تەکنەلۆژیای GPT سادەیە. داواکارییەکان، پرسیارەکانت یان ئامۆژگارییەکانت وەردەگرێت و بە خێرایی وەڵامیان دەداتەوە. بەڵام لەڕاستییدا تەکنەلۆژیای ئەنجامدانی ئەم کارە زۆر ئاڵۆزترە لەوەی کە بیری لێ دەکەیتەوە. ئەم مۆدێلە بە بەکارهێنانی بنکەی زانیاری دەقی لە ئینتەرنێتەوە ڕاهێنراوە. ئەمەش داتایەکی گەورەی بە قەبارەی ٥٧٠ گێگابایت لەخۆگرتووە کە لە کتێب، ویکیپیدیا، وتار و پارچە نووسینەکانی تر لە ئینتەرنێتدا بەدەست هاتووە. بە جۆرێکی تر دەتوانین بڵێین زیاتر لە ٣٠٠ ملیار وشە خراوەتە ناو سیستمەکەوە. وەک مۆدێلێکی زمان* کار لەسەر ئەگەر دەکات، توانای پێشبینیکردنی هەیە کە وشەی داهاتوو لە ڕستەیەکدا دەبێت چی بێت. بۆ ئەوەی بگاتە دەرئەنجامێک کە بتوانێت ئەم کارە بکات، چاتەکە لە ژێر سەرپەرشتییدا بە قۆناغی تاقیکردنەوەدا تێپەڕیوە. بۆ نموونە کە سەرەتا پرسیاری لێدەکرێت ئەگەری هەیە بەو زانیارییانەی لە بەردەستیدایە بە ڕاستی وەڵام بداتەوە، وە لەکاتێکدا ئەگەر وەڵامەکەی هەڵە بوو، سەرپەرشتیارانی پڕۆژەکە وەڵامە ڕاستەکەی فێردەکەن و زانیارییەکانی بۆ جاری داهاتوو زیاد دەکات. پاشان بە قۆناغی دووەمی هاوشێوەدا تێدەپەڕێت و چەندین وەڵام دەخاتە بەردەست لەگەڵ ئەندامێکی سەرپەرشتیار کە لە باشترینەوە بۆ خراپترین بۆی ڕیزبەندی دەکات بەمەش مۆدێلەکە لەسەر بەراوردکردنەکان ڕادەهێنێت.''',
    type: "Psychology",
  ),
  Articles(
    title: "نقشی جەمەنی زانیاری لە شەڕکردنەکاندا",
    author: "ئاڵی کەریم",
    imgUrl: "assets/ss.jpg",
    likes: 200,
    comments: 60,
    date: "2024-10-10",
    detail:
        "جەمەنی زانیاری بە شێوەیەکی بەرز لە گەشە و شەڕکردنەکاندا دەبێتە هۆی گۆڕینەوەی ڕووداوەکان. ئه‌م وتاره‌ باسی ئەوە دەکات کە چۆن توانای زانیارییەکان و ئۆنلاین شتێکان شیکاری شەڕە نوێیەکان دەکەن، بە شێوەیەکی تایبەتی لە بوارە زانستیەکاندا کە ئەوازی جیهانی نوێ دەگرێت.زانستی ئاسمانی نوێ هەندێک ڕوونکردنەوەی جۆراوجۆر پێشکەش دەکات کە بەناو زانستی ستەرەشناسی نوێ ئەگەڕێت. هەوڵی ئەوە دەدرێت بۆ فەرمی کردنەوەی بوارەکان و دۆزینەوەی ئەو شتانەی کە بەدەستهاتوون وەکوو ئەڵوگۆڕی ستەرەیی و کەشوهەواکان. ئەم زانیاریە نوێیەکان بەناوبانگترین ڕووداوە ستەرەشناسییەکان شیکاری کردووە.",
    type: "Social",
  ),
  Articles(
    title: "ئەو کورتە زانیاریانەی دەبێت هەر کەس بدات",
    author: "ئازاد عومەر",
    imgUrl: "assets/te.jpeg",
    likes: 150,
    comments: 40,
    date: "2024-09-25",
    detail:
        "ئەم وتارە باسی ئەوە دەکات کە چۆن کورتە زانیاریەکان بە هەموو کەسانیەوە دەگەیەن و بە تایبەتی نیشانی ئەوە دەدات کە زانیاری ناوەندی لە بوارە گەشەییەکاندا چەند گرنگە. ئامانجی وتارەکە هەڵسا کردنەوەی کورتە زانیاریەکان و چۆنیەتی بەدەستهێنانەوەی ئەنجامەکانی کارە نوێیەکانە.زانستی ئاسمانی نوێ هەندێک ڕوونکردنەوەی جۆراوجۆر پێشکەش دەکات کە بەناو زانستی ستەرەشناسی نوێ ئەگەڕێت. هەوڵی ئەوە دەدرێت بۆ فەرمی کردنەوەی بوارەکان و دۆزینەوەی ئەو شتانەی کە بەدەستهاتوون وەکوو ئەڵوگۆڕی ستەرەیی و کەشوهەواکان. ئەم زانیاریە نوێیەکان بەناوبانگترین ڕووداوە ستەرەشناسییەکان شیکاری کردووە.",
    type: "Education",
  ),
  Articles(
    title: "چۆن تیکەڵکردنی ئۆتۆماتیکی زانیاری گەشە دەدات؟",
    author: "ڕەفیق حەمە",
    imgUrl: "assets/t.jpeg",
    likes: 95,
    comments: 25,
    date: "2024-08-30",
    detail:
        "تیکەڵکردنی ئۆتۆماتیکی زانیاری بە شێوەیەکی نوێ توانایەکان و ئەنجامەکان دەگۆڕێت. ئەم وتارە باسی ئەوە دەکات کە چۆن توانای ئۆتۆماتیکی بەرزتر دەبێت وەکوو بڕیارەکان، فێرکاریەکان، و چالاکی نوێیەکان. ئامانجی فەرمی کردنەوەی ئایندەی گەشەی بوارە زانستیەکانە.زانستی ئاسمانی نوێ هەندێک ڕوونکردنەوەی جۆراوجۆر پێشکەش دەکات کە بەناو زانستی ستەرەشناسی نوێ ئەگەڕێت. هەوڵی ئەوە دەدرێت بۆ فەرمی کردنەوەی بوارەکان و دۆزینەوەی ئەو شتانەی کە بەدەستهاتوون وەکوو ئەڵوگۆڕی ستەرەیی و کەشوهەواکان. ئەم زانیاریە نوێیەکان بەناوبانگترین ڕووداوە ستەرەشناسییەکان شیکاری کردووە.",
    type: "Technology",
  ),
  Articles(
    title: "چۆن جێبەجێکردنی چۆکاتە کۆمپیووتەریەکان ڕووناک دەبێت؟",
    author: "سەردار جەمال",
    imgUrl: "assets/s.jpg",
    likes: 110,
    comments: 35,
    date: "2024-07-15",
    detail:
        "پیشەی کۆمپیووتەر بە شێوەیەکی زۆر گەورە لە زانیاری و درووستکردنی چۆکاتە زانستیەکان تەرخان بووە. ئەم وتارە دەربارەی ڕووناککردنەوەی کێشەکان و ڕێگاکانی چارەسەر دەچێت کە چۆن توانایەکانی کۆمپیووتەر گەشە دەدات و ئاسایی دەکات.زانستی ئاسمانی نوێ هەندێک ڕوونکردنەوەی جۆراوجۆر پێشکەش دەکات کە بەناو زانستی ستەرەشناسی نوێ ئەگەڕێت. هەوڵی ئەوە دەدرێت بۆ فەرمی کردنەوەی بوارەکان و دۆزینەوەی ئەو شتانەی کە بەدەستهاتوون وەکوو ئەڵوگۆڕی ستەرەیی و کەشوهەواکان. ئەم زانیاریە نوێیەکان بەناوبانگترین ڕووداوە ستەرەشناسییەکان شیکاری کردووە.",
    type: "Computer Science",
  ),
  Articles(
    title: "ئاستی بەرەوپیشبردنی خوێندنی ماشینی",
    author: "ڤیان محەممەد",
    imgUrl: "assets/te.jpeg",
    likes: 130,
    comments: 50,
    date: "2024-06-20",
    detail:
        "خوێندنی ماشینی بەرەوپیش چالاکیە نوێیەکان بەدەست هێنا. ئەم وتارە بە شێوەیەکی تایبەتی باسی دەکات کە چۆن توانای خوێندنی ماشینی و زانینی پڕۆسەکانی سەرکەوتنەوە ڕووناک دەبێت. ئامانجی وتارەکە چاکسازی و بەرزکردنەوەی ئاستە نوێیەکانە.",
    type: "Computer Science",
  ),
];

// Article Card Widget
// class ArticleCard extends StatelessWidget {
//   final String category;
//   final String author;
//   final String title;
//   final String description;
//   final String time;
//   final int views;
//   final int comments;
//   final String imageUrl;

//   const ArticleCard({
//     super.key,
//     required this.category,
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.time,
//     required this.views,
//     required this.comments,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ArticleDetailPage(
//                   category: category,
//                   author: author,
//                   title: title,
//                   description: description,
//                   time: time,
//                   views: views,
//                   comments: comments,
//                   imageUrl: imageUrl),
//             ));
//       },
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           color: Theme.of(context).cardColor,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 // Article Text
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             category,
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall?.color,
//                               fontSize: 12,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             "by $author",
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall?.color,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         title,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).textTheme.bodyLarge?.color,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         description,
//                         style: TextStyle(
//                           color: Theme.of(context).textTheme.bodyMedium?.color,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Text(
//                             time,
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall?.color,
//                               fontSize: 12,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Text(
//                             "$views views",
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall?.color,
//                               fontSize: 12,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Text(
//                             "$comments comments",
//                             style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall?.color,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Thumbnail
//                 const SizedBox(width: 16),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     imageUrl,
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.black,
//               thickness: 1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
 // children: [
      //   ArticleCard(
      //     category: category,
      //     author: "Derrick Story",
      //     title:
      //         "How to Use the Two-Bag System for Efficient Travel Photography",
      //     description: "Bring everything, but carry only what you need",
      //     time: "1d ago",
      //     views: 328,
      //     comments: 8,
      //     imageUrl: "assets/t.jpeg",
      //   ),
      //   ArticleCard(
      //     category: category,
      //     author: "Oliver Foster",
      //     title: "What’s the Difference Between localhost and 127.0.0.1?",
      //     description: "My article is open to everyone.",
      //     time: "Feb 1",
      //     views: 6400,
      //     comments: 65,
      //     imageUrl: "assets/t.jpeg",
      //   ),
      //   ArticleCard(
      //     category: category,
      //     author: "Derrick Story",
      //     title:
      //         "How to Use the Two-Bag System for Efficient Travel Photography",
      //     description: "Bring everything, but carry only what you need",
      //     time: "1d ago",
      //     views: 328,
      //     comments: 8,
      //     imageUrl: "assets/t.jpeg",
      //   ),
      //   ArticleCard(
      //     category: category,
      //     author: "Derrick Story",
      //     title:
      //         "How to Use the Two-Bag System for Efficient Travel Photography",
      //     description: "Bring everything, but carry only what you need",
      //     time: "1d ago",
      //     views: 328,
      //     comments: 8,
      //     imageUrl: "assets/t.jpeg",
      //   ),
      //   ArticleCard(
      //     category: category,
      //     author: "Derrick Story",
      //     title:
      //         "How to Use the Two-Bag System for Efficient Travel Photography",
      //     description: "Bring everything, but carry only what you need",
      //     time: "1d ago",
      //     views: 328,
      //     comments: 8,
      //     imageUrl: "assets/t.jpeg",
      //   ),
      // ],