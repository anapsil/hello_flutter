import 'package:flutter/material.dart';
import 'package:flutter_intro/models/dog.dart';
import 'package:flutter_intro/screens/dog_details_screen.dart';
import 'package:flutter_intro/utils/nav.dart';

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("List");
                setState(() {
                  _gridView = false;
                });
              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print("Grid");
                setState(() {
                  _gridView = true;
                });
              }),
        ],
      ),
      body: _body(context),
    );
  }

  _body(context) {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Golden", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Border Collie", "assets/images/dog5.png"),
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) => _item(dogs[index]),
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) => _item(dogs[index]),
      );
    }
  }

  _item(dog) =>
      GestureDetector(
        onTap: () => push(context, DogDetailsScreen(dog)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _image(dog.photo),
            _text(dog.name),
          ],
        ),
      );

  _image(String path) => Image.asset(path, fit: BoxFit.cover);

  _text(String name) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(8)),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
