import 'package:covid_count/models/therapeutic.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/therapeutic/therapeutic_list.dart';
import 'package:covid_count/widgets/therapeutic/therapeutic_list_header.dart';
import 'package:flutter/material.dart';

class TherapeuticRoute extends StatelessWidget {
  final List<Therapeutic> therapeutics;
  final Function getData;

  TherapeuticRoute(this.therapeutics, this.getData);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 90,
        child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(color: MyColors.background),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TherapeuticListHeader(
                            therapeuticCount: therapeutics.length,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 20, 10),
                            child: Text(
                              'Latest Therapeutic Updates',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TherapeuticList(
                            therapeutics: therapeutics,
                            getData: getData,
                          )
                        ])))));
  }
}
