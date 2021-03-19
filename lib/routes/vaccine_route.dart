import 'package:covid_count/models/vaccine.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/vaccine/vaccine_list.dart';
import 'package:covid_count/widgets/vaccine/vaccine_list_header.dart';
import 'package:flutter/material.dart';

class VaccineRoute extends StatelessWidget {
  final List<Vaccine> vaccines;
  final Function getData;

  VaccineRoute(this.vaccines, this.getData);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 90,
        child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(color: MyColors.background),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          VaccineListHeader(
                            vaccineCount: vaccines.length,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 40, 20, 10),
                            child: Text(
                              'Latest Vaccine Updates',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          VaccineList(
                            vaccines: vaccines,
                            getData: getData,
                          )
                        ])))));
  }
}
