import 'package:covid_count/resource/colors.dart';
import 'package:flutter/material.dart';

class AboutUsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 90,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/purple.png'),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter),
          color: MyColors.background),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(900),
              child: Image(
                image: AssetImage('assets/images/profile.jpeg'),
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.link,
                      size: 30,
                      color: MyColors.hotPurple,
                    ),
                    label: Text(
                      'Linkedin: arminknot',
                      style: TextStyle(color: MyColors.hotPurple, fontSize: 16),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.link,
                      size: 30,
                      color: MyColors.hotPurple,
                    ),
                    label: Text(
                      'Instagram: secretsofcode',
                      style: TextStyle(color: MyColors.hotPurple, fontSize: 16),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'All in app data provided by disease.sh public API. for more information please visit: corona.lmao.ninja/docs',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'If you like this app please rate and review it on store.',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
