import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_create/views/screens/friendshipQuotes.dart';
import 'package:quotes_create/views/screens/happiness.dart';
import 'package:quotes_create/views/screens/love.dart';
import 'package:quotes_create/views/screens/motivational.dart';
import 'package:quotes_create/views/screens/sucess.dart';

import '../../Helper/db_helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List screen = [
  const FriendshipQuoteScreen(),
  const HappinessQuoteScreen(),
  const LoveQuoteScreen(),
  const MotivationalQuoteScreen(),
  const SuccessQuoteScreen(),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes and Sayings",
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: DBHelpers.dbHelpers.fetchRecord(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text(
                "${snapShot.hasError}",
              );
            } else if (snapShot.hasData) {
              var data = snapShot.data;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => screen[index],
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(data[index]['image']),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data[index]['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
