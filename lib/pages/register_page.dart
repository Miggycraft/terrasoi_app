import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<String> status = <String>[
    'Farmer',
    'Restaurant Owner',
    'Delivery'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/background.png'))),
          child: Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    'assets/terrasoi_logo.jpg',
                  ),
                  height: 250.0,
                ),
                Text(
                  "Create New \nAccount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.1,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.w600,
                      fontSize: 45.0,
                      color: Color.fromRGBO(4, 50, 28, 1)),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 25.0,
                        ),
                        Image.asset(
                          'assets/icons/farmer_icon.png',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        SizedBox(
                          width: 300.0,
                          // height: 55,
                          child: DropdownButtonFormField<String>(
                            hint: Text(
                              'Select Account Status',
                              textAlign: TextAlign.center,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            isDense: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            items: status
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25.0,
                        ),
                        Image.asset(
                          'assets/icons/mail_icon.png',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          width: 300.0,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              hintText: 'Email Address',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25.0,
                    ),
                    Image.asset(
                      'assets/icons/phone_icon.png',
                      width: 40,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      width: 300.0,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 65.0),
                      backgroundColor: const Color.fromRGBO(155, 231, 157, 1),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/home'),
                    child: const Text('Register')),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Return to Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
