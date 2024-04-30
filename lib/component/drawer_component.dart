import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List drawerItems = [
      ['Edit Profile  ', Icons.account_circle_outlined],
      ['Review Payment Options', Icons.credit_score_outlined],
      ['Donate', Icons.handshake_outlined],
      ['Settings', Icons.settings_outlined],
      ['Help', Icons.help_outline],
      ['Terms and Conditions', Icons.description_outlined]
    ];

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Colors.green,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green[200]),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 35,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage('assets/profile_pic.jpg'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Miggy Olalo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Facility Manager',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 10,
                            ),
                            Text(
                              'Online',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) => ListTile(
                          shape: Border(bottom: BorderSide(color: Colors.grey)),
                          title: Text(
                            drawerItems[index][0],
                            style: TextStyle(color: Colors.green),
                          ),
                          leading: Icon(
                            drawerItems[index][1],
                            color: Colors.green,
                          ),
                        )),
              ),
              const SizedBox(
                height: 130,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
                child: const Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                    Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
