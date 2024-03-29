import 'package:covid_count/models/world.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:flutter/material.dart';

class CountryListHeader extends StatelessWidget {
  final World world;

  const CountryListHeader(this.world);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              MyColors.lightPink,
              MyColors.hotPink,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'COVID-19 Pandemic',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Image(
                    image: AssetImage("assets/images/coronavirus.png"),
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total cases:',
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${world.cases}',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total death:',
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${world.deaths}',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total recovered:',
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${world.recovered}',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
