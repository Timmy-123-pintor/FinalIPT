// ignore_for_file: depend_on_referenced_packages

import 'package:airlogin/provider/timmy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import 'package:collection/collection.dart';

import 'botNavBar.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final timsProvider = Provider.of<TimsProvider>(context);
    final user = timsProvider.usersList.firstOrNull;
    return Scaffold(
        backgroundColor: tWhite,
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Image.asset(
                "assets/images/plane.gif",
                height: 500,
                width: 500,
              ),
            ),
            if (user != null)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'WELCOME! ${user.firstname}',
                    style: TextStyle(
                        color: tBlack,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            Container(
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(colors: [tgradbut1, tgradbut2]),
              ),
              child: MaterialButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tabbar(),
                    ),
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
