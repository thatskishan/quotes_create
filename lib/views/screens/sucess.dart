import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_create/Globals/global.dart';

import '../../Helper/db_helpers.dart';

class SuccessQuoteScreen extends StatefulWidget {
  const SuccessQuoteScreen({Key? key}) : super(key: key);

  @override
  State<SuccessQuoteScreen> createState() => _SuccessQuoteScreenState();
}

class _SuccessQuoteScreenState extends State<SuccessQuoteScreen> {
  int i = 0;
  int j = 0;
  int k = 0;
  Random r = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success Quotes",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: DBHelpers.dbHelpers.fetchSRecord(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text(
                "${snapShot.hasError}",
              );
            } else if (snapShot.hasData) {
              var data = snapShot.data;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(Global.wallpaper[j]),
                        ),
                        Text(
                          data[i],
                          textAlign: TextAlign.center,
                          style: Global.font[k],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (i >= 1) {
                                i = i - 1;
                              } else {
                                i = 0;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (j <= 3) {
                                j = j + 1;
                              } else {
                                j = 0;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.wallpaper,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (k <= 3) {
                                k = k + 1;
                              } else {
                                k = 0;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.format_color_text_sharp,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (i <= 3) {
                                i = i + 1;
                              } else {
                                i = 0;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
