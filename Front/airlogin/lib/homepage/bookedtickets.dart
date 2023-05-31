// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../provider/timmy_provider.dart';
import 'bookedticks_display.dart';
import 'package:collection/collection.dart';

class BookedTickets extends StatelessWidget {
  const BookedTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final timsprovider = Provider.of<TimsProvider>(context);
    final bookedTicketCount = timsprovider.bookedFlights.length;

    final user = timsprovider.usersList.firstOrNull;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
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
                      "Welcome!\n${user.firstname} ${user.lastname}",
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
                    offset: const Offset(0, 3),
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
                        'Booked Tickets: $bookedTicketCount',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: const BookedTicketDisplay(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
