import 'package:flutter/material.dart';
import '../main.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _isClicked = false;
  @override
  //context is a bridge between widgets
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: GestureDetector(
        child: _isClicked
            ? Image.asset('images/A_royal_in_paradise.jpg')
            : Center(child: Image.network(
                'https://thriveworks.com/wp-content/uploads/2023/07/Love-hate-relationship.jpg?w=300')), 
        onTap: () {
          setState(() {
            _isClicked = !_isClicked;
          });
        },
      ),
    );
  }
}