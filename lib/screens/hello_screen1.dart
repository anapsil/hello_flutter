import 'package:flutter/material.dart';
import 'package:flutter_intro/widgets/blue_button.dart';

class HelloScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: _body(context),
    );
  }

  _body(context) => Center(
        child: BlueButton("Voltar", () => _onClickVoltar(context)),
      );

  _onClickVoltar(context) => Navigator.pop(context, "Screen 1");
}
