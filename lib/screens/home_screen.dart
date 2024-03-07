import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_web/screens/login_page.dart';
import 'package:iparkpatrol_web/screens/tabs/home_tab.dart';
import 'package:iparkpatrol_web/screens/tabs/parking_tab.dart';

import '../utlis/colors.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool inhome = true;
  bool inhistory = false;

  bool inenforcers = false;
  bool intickets = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Card(
              child: SizedBox(
                width: 300,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: primary),
                              shape: BoxShape.circle,
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: Image.asset(
                              'assets/images/RTA logo 1.png',
                              height: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text: 'RTA Administrator',
                          fontFamily: 'Bold',
                          fontSize: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      tileColor: inhome ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inhome = true;
                          inhistory = false;
                          inenforcers = false;
                          intickets = false;
                        });
                      },
                      title: TextWidget(
                        text: 'Home',
                        fontSize: 18,
                        color: inhome ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: inhistory ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inhome = false;
                          inhistory = true;
                          inenforcers = false;
                          intickets = false;
                        });
                      },
                      title: TextWidget(
                        text: 'Illegal Parking History',
                        fontSize: 18,
                        color: inhistory ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: inenforcers ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inhome = false;
                          inhistory = false;
                          inenforcers = true;
                          intickets = false;
                        });
                      },
                      title: TextWidget(
                        text: 'Manage Enforcers',
                        fontSize: 18,
                        color: inenforcers ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: intickets ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inhome = false;
                          inhistory = false;
                          inenforcers = false;
                          intickets = true;
                        });
                      },
                      title: TextWidget(
                        text: 'Citation Tickets',
                        fontSize: 18,
                        color: intickets ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Logout Confirmation',
                                    style: TextStyle(
                                        fontFamily: 'QBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to Logout?',
                                    style: TextStyle(fontFamily: 'QRegular'),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      },
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      title: TextWidget(
                        text: 'Logout',
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextWidget(
                          text: DateFormat('MMMM dd, yyyy | hh:mm a')
                              .format(DateTime.now()),
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  inhome ? const HomeTab() : const ParkingTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
