import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxTitle extends StatelessWidget {
  final String title;

  const BoxTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle subheaderBold =
        TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              FaIcon(FontAwesomeIcons.chartBar, size: 25, color: Colors.black),
              Text(
                '$title',
                style: subheaderBold,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 20,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
