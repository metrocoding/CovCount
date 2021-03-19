import 'package:flutter/material.dart';

class WhiteBox extends StatelessWidget {
  final List<Widget> children;

  const WhiteBox({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: children)));
  }
}
