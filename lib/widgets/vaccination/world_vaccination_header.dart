import 'package:covid_count/config/config.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/utility/util.dart';
import 'package:flutter/material.dart';

class WorldVaccinationHeader extends StatelessWidget {
  final int vaccinationCount;

  const WorldVaccinationHeader({Key key, this.vaccinationCount})
      : super(key: key);

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
              MyColors.lightGreen,
              MyColors.hotGreen,
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
                    'Vaccination Data',
                    style: Config.headerTitle,
                  ),
                  Image(
                    image: AssetImage("assets/images/injection.png"),
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total vaccination:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${Util.toNumericFormat(vaccinationCount.toString())}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
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
