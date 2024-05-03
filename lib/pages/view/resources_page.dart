import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ArticleDetailPage.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  // Example list of articles; ideally, this would come from a database or API
  final List<Map<String, dynamic>> articles = [
    {
      'title': 'The Ultimate Guide to Farming',
      'subtitle': 'Read a selection of opinion pieces from world class journalists only on our blog',
      'image': 'assets/Pictures/FarmBlog2.jpg',
      'author': 'Mr. Nice Guy',
      'readTime': '15 min read'
    },
    {
      'title': 'Fighting Food Hunger',
      'subtitle': 'Explore innovative approaches to combating hunger globally',
      'image': 'assets/Pictures/Foodhunger.jpg',
      'author': 'The Good Cop',
      'readTime': '5 min read'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return buildArticleCard(context, articles[index], index);
        },
      ),
    );
  }

  Widget buildArticleCard(BuildContext context, Map<String, dynamic> article, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleDetailPage(article: article)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Weekly Article ${DateTime.now().subtract(Duration(days: index * 7)).toString().substring(0, 10)}', // Dynamic date generation
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.asset(
                    article['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text(
                    article['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(article['subtitle']),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '${article['author']} | ${article['readTime']}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
