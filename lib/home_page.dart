import 'package:flutter/material.dart';
import 'package:flutter_intro/screens/hello_listview.dart';
import 'package:flutter_intro/screens/hello_screen2.dart';
import 'package:flutter_intro/screens/hello_screen3.dart';
import 'package:flutter_intro/utils/nav.dart';
import 'package:flutter_intro/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter!!!"),
          centerTitle: false,
        ),
        body: _body(context),
      );

  _body(BuildContext context) =>
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView", () => _onClickNavigator(context, HelloListView())),
                BlueButton("Screen 2", () => _onClickNavigator(context, HelloScreen2())),
                BlueButton("Screen 3", () => _onClickNavigator(context, HelloScreen3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", _onClickSnack),
                BlueButton("Dialog", _onClickDialog),
                BlueButton("Toast", _onClickToast),
              ],
            ),
          ],
        ),
      );

  _pageView() =>
      Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        height: 300,
        child: PageView(
          children: <Widget>[
            _image("assets/images/dog1.png"),
            _image("assets/images/dog2.png"),
            _image("assets/images/dog3.png"),
            _image("assets/images/dog4.png"),
            _image("assets/images/dog5.png"),
          ],
        ),
      );

  _text() =>
      Text(
        "Hello world",
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.dashed,
        ),
      );

  _image(String path) =>
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      );

  void _onClickNavigator(BuildContext context, Widget screen) async {
    String s = await push(context, screen);
    print(" >> $s");
  }

  _onClickSnack() {}

  _onClickDialog() {}

  _onClickToast() {}
}
