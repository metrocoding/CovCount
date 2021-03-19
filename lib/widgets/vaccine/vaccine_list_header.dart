import 'package:covid_count/resource/colors.dart';
import 'package:flutter/material.dart';

class VaccineListHeader extends StatelessWidget {
  final int vaccineCount;

  const VaccineListHeader({Key key, this.vaccineCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 15,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(15), color: MyColors.hotBlue),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vaccines data',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        Image(
                          image: AssetImage("assets/images/syringe.png"),
                          height: 40,
                          width: 40,
                        )
                      ])),
              Row(children: [
                Text(
                  'Total vaccines:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '$vaccineCount',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ))
              ])
            ])));
  }
}
