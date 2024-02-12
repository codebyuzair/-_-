import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class QuoteScreen extends StatefulWidget {
  final String name;
  const QuoteScreen({super.key, required this.name});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String quote = "";
  final List<String> allQuotes = [
    "Be the change you wish to see in the world.",
    "Dream big. Sparkle more. Shine bright.",
    "Embrace the journey, not the outcome.",
    "Stay positive, work hard, make it happen.",
    "Create your own sunshine.",
    "Chase your dreams, not people.",
    "Every day is a second chance.",
    "Life is short, make it sweet.",
    "Keep smiling, because life is a beautiful thing.",
    "You are capable of amazing things.",
    "Find joy in the ordinary.",
    "Make today amazing.",
    "Be fearless in the pursuit of what sets your soul on fire.",
    "Life is tough but so are you.",
    "Choose joy.",
    "Do what makes your soul happy.",
    "Believe you can and you're halfway there.",
    "Wherever you go, go with all your heart.",
    "Stay focused and never give up.",
    "Start each day with a grateful heart.",
    "The best is yet to come.",
    "Live, laugh, love.",
    "Follow your dreams, they know the way.",
    "Don't count the days, make the days count.",
    "Happiness is a journey, not a destination.",
    "The only way to do great work is to love what you do.",
    "Let your light shine.",
    "You are enough.",
    "Life is tough, but so are you.",
    "Make each day your masterpiece.",
    "Keep going. You're getting there.",
    "Believe in yourself and all that you are.",
    "Good things take time.",
    "Be the reason someone smiles today.",
    "You are stronger than you think.",
    "Life is too short to wait.",
    "The sky's the limit.",
    "Stay humble, work hard, be kind.",
    "Life is a journey, not a race.",
    "You got this.",
    "Stay true to yourself.",
    "Keep your face always toward the sunshine.",
    "You are braver than you believe, stronger than you seem, and smarter than you think.",
    "Do more of what makes you happy.",
    "Life begins at the end of your comfort zone.",
    "Success is not final, failure is not fatal: it is the courage to continue that counts.",
    "Stay positive, work hard, make it happen.",
    "Don't be afraid to fail. Be afraid not to try.",
    "The secret of getting ahead is getting started.",
    "Never, never, never give up."
  ];

  void generateRandomQuote() {
    quote = allQuotes[Random().nextInt(allQuotes.length)];
  }

  void showQuoteDialog() {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            elevation: 1,
            content: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4338CA),
                    Color(0xff6D28D9),
                  ],
                ), // color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Quote",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      quote,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          final result = await Share.shareWithResult(
                              quote);

                          if (result.status == ShareResultStatus.success) {
                            print('Thank you for sharing my website!');
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Hey, ${widget.name}!",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Click to generate \n a new Quote",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                generateRandomQuote();
                showQuoteDialog();
                setState(() {});
              },
              child: Image.asset(
                "images/shuffle.png",
                width: 80,
                height: 80,
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     generateRandomQuote();
            //     showQuoteDialog();
            //     setState(() {});
            //   },
            //   icon: const Icon(Icons.shuffle_on_outlined),
            // ),
            // Center(
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8
            //         ),
            //     shrinkWrap: true,
            //     itemCount: 1,
            //     itemBuilder: (context, index) {
            //       return Ink.image(
            //         image: const AssetImage("images/shuffle.png",),
            //         fit: BoxFit.cover,
            //         child: InkWell(
            //           borderRadius: BorderRadius.circular(10),
            //           onTap: () {
            //             generateRandomQuote();
            //             showQuoteDialog();
            //             setState(() {});
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
