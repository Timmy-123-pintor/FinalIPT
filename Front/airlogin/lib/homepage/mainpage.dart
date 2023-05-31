// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:airlogin/homepage/ticket_display.dart';
import 'package:airlogin/provider/timmy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import 'package:collection/collection.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final timsProvider = Provider.of<TimsProvider>(context);
    final user = timsProvider.usersList.firstOrNull;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 100, top: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.airplane_ticket,
                    color: tWhite,
                    size: 40,
                  ),
                  if (user != null)
                    Text(
                      "Let's book your\nflight, ${user.firstname} ${user.lastname}",
                      style: TextStyle(
                          color: tWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: tWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Available Flights:',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: TicketDisplay(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
