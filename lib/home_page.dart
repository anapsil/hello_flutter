import 'package:flutter/material.dart';
import 'package:flutter_intro/screens/hello_listview.dart';
import 'package:flutter_intro/screens/hello_screen2.dart';
import 'package:flutter_intro/screens/hello_screen3.dart';
import 'package:flutter_intro/utils/nav.dart';
import 'package:flutter_intro/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter!!!"),
          centerTitle: false,
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Adicionar");
          },
          child: Icon(Icons.add),
        ),
      );

  _body() =>
      Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  BlueButton("Snack", () => _onClickSnack(context)),
                  BlueButton("Dialog", () => _onClickDialog(context)),
                  BlueButton("Toast", _onClickToast),
                ],
              ),
            ],
          );
        }),
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

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Hello Flutter"),
      action: SnackBarAction(
        label: "OK",
        onPressed: () => {},
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!!!!");
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Hello Flutter!!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black26,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
