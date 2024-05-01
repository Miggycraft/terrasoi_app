import 'package:flutter/material.dart';
import 'package:terrasoi/component/drawer_component.dart';
import 'package:terrasoi/pages/view/dashboard_page.dart';
import 'package:terrasoi/pages/view/reporting_page.dart';
import 'package:terrasoi/pages/view/resources_page.dart';
import 'package:terrasoi/pages/view/scheduling_page.dart';
import 'package:terrasoi/pages/view/messaging_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List _pages = [
    [const DashboardPage(), 'Home'],
    [const SchedulingPage(), 'Scheduling'],
    [const ReportingPage(), 'Reports'],
    [const ResourcesPage(), 'Resources'],
    [const MessagingPage(), 'Chats'],
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          _pages[_selectedIndex][1],
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
      body: _pages[_selectedIndex][0],
      drawer: DrawerComponent(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                onPressed: () {
                  navigateBottomBar(0);
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 45,
                  color: Colors.green,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                onPressed: () {
                  navigateBottomBar(1);
                },
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 45,
                  color: Colors.green,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                onPressed: () {
                  navigateBottomBar(2);
                },
                icon: Icon(
                  Icons.auto_graph,
                  size: 45,
                  color: Colors.green,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                onPressed: () {
                  navigateBottomBar(3);
                },
                icon: Icon(
                  Icons.book_outlined,
                  size: 45,
                  color: Colors.green,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                onPressed: () {
                  navigateBottomBar(4);
                },
                icon: Icon(
                  Icons.chat_outlined,
                  size: 45,
                  color: Colors.green,
                ),
              )),
        ],
      ),
    );
  }
}
