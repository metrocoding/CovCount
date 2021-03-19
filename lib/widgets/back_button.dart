import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {},
              child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.chevronLeft,
                      size: 30, color: Colors.white),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
        )
      ],
    );
  }
}
