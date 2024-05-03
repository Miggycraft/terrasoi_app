import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Weekly Article 04/04/2024',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners for the card
              ),
              margin: EdgeInsets.all(16),
              child: ClipRRect( // Clip the image with rounded corners
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/Pictures/FarmBlog2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'The Ultimate Guide to Farming',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Read a selection of opinion pieces from world class journalists only on our blog',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Mr. Nice Guy | 15 min read',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
            // If you have more content or elements to add, continue here
          ],
        ),
      ),
    );
  }
}
