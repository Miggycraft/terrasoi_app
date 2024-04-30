import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.green,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green[200]),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 35,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage('assets/profile_pic.jpg'),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Miggy Olalo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text('Facility Manager', style: TextStyle(color: Colors.grey[600], fontSize: 10),),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green,size: 10,),
                            Text('Online', style: TextStyle(fontSize: 10),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
