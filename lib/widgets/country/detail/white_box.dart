import 'package:flutter/material.dart';

class WhiteBox extends StatelessWidget {
  final List<Widget> children;

  const WhiteBox({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: children)),
      ),
    );
  }
}
