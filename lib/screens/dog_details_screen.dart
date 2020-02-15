import 'package:flutter/material.dart';
import 'package:flutter_intro/models/dog.dart';

class DogDetailsScreen extends StatelessWidget {
  final Dog dog;

  DogDetailsScreen(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Image.asset(dog.photo),
    );
  }
}
