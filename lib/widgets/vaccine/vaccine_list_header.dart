import 'package:covid_count/resource/colors.dart';
import 'package:flutter/material.dart';

class VaccineListHeader extends StatelessWidget {
  final int vaccineCount;

  const VaccineListHeader({Key key, this.vaccineCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                MyColors.lightGreenBlue,
                MyColors.hotGreenBlue,
              ],
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vaccines Data',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Image(
                        image: AssetImage("assets/images/syringe.png"),
                        height: 40,
                        width: 40,
                      )
                    ]),
                Row(children: [
                  Text(
                    'Total vaccines:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '$vaccineCount',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ))
                ])
              ]))),
    );
  }
}
