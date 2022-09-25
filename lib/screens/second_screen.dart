import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String quoteText;
  String authorName;

  SecondScreen({Key? key, required this.quoteText, required this.authorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(quoteText, style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(alignment: Alignment.bottomRight, child: Text("- $authorName", style: TextStyle(fontSize: 16),)),
            ),
          ],
        ),
      )
    );
  }
}