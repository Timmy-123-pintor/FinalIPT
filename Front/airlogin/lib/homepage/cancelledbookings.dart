import 'package:airlogin/provider/timmy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import 'cancelledbookingdisplay.dart';

class CancelledBookedTickets extends StatelessWidget {
  const CancelledBookedTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final timsProvider = Provider.of<TimsProvider>(context);
    final cancelledBookedTicketCount =
        timsProvider.bookedFlightscancelled.length;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
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
                children: const [
                  Icon(
                    Icons.airplane_ticket,
                    color: tWhite,
                    size: 40,
                  ),
                  Text(
                    "Let's book your\nflight",
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
                        'Cancelled Flight Tickets: $cancelledBookedTicketCount',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: const CancelledBookedTicketDisplay(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //edit here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.blue, // Replace with your desired button color
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
