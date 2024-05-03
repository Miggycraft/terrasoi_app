import 'package:flutter/material.dart';

class appBarComponent extends StatelessWidget implements PreferredSizeWidget{
  appBarComponent({super.key, required this.pageText});
  late String pageText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.green),
      title: Text(
        pageText
        // _pages[_selectedIndex][1],
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
