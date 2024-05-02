import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15, top: 15),
                      isDense: true,
                      hintText: 'SEARCH ALL',
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.green)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.manage_search,
                      color: Colors.green,
                      size: 30,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
