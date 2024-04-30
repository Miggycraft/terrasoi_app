import 'package:flutter/material.dart';
import 'package:terrasoi/component/drawer_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          'Home',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 40,
                color: Colors.green,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // SEARCH ALL
            Row(
              children: [],
            )

            // ANALYTICS
            // ANALYTICS BUT COLUMN

            // PENDING APPROVAL
            // PENDING APPROVAl BUT SLIDING??? (IDK PA)

            // RECENT CONTACTS
            // SAME SHIT W BEFORE
          ],
        ),
      ),
      drawer: DrawerComponent(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 45,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
                size: 45,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph,
                size: 45,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                size: 45,
                color: Colors.green,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                size: 45,
                color: Colors.green,
              ),
              label: ''),
        ],
      ),
    );
  }
}
