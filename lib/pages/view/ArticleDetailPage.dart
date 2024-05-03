import 'package:flutter/material.dart';
import 'package:terrasoi/component/appBar_component.dart';

class ArticleDetailPage extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(pageText: 'Resources'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weekly Article | ${article['dateCreated']}",
                style: TextStyle(fontSize: 23, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "${article['author']} | ${article['readTime']}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                article['title'],
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                    letterSpacing: 0,
                    height: 0),
              ),
              SizedBox(height: 8),
              Text(
                article['subtitle'],
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(article['image'], fit: BoxFit.cover)),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna '
                    'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
                    'ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
