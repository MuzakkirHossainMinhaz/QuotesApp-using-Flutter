import 'package:flutter/material.dart';
import 'package:qoutesapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  State<HomeScreen> createState() => _HomeScreenState();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea (
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quote Generator"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(quote, style: TextStyle(fontSize: 20),),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 14.0),
              child: Align(alignment: Alignment.bottomRight, child: Text("- $author", style: TextStyle(fontSize: 16),)),
            ),
              ElevatedButton(
                onPressed: () async{
                  var url = Uri.parse("http://programming-quotes-api.herokuapp.com/Quotes?count=1");
                  var response = await http.get(url);
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                  var data = jsonDecode(response.body);

                  quote = data[0]["en"];
                  author = data[0]["author"];

                  setState(() {});

                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen(quoteText: quote, authorName: author,)));
                },
                child: const Text("Get New Quote !"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}