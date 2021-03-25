import 'package:covid_count/models/vaccine.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/back_button.dart';
import 'package:covid_count/widgets/country/detail/white_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VaccineDetail extends StatelessWidget {
  final Vaccine vaccine;

  const VaccineDetail({Key key, this.vaccine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headerBold = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: MyColors.background),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          MyColors.lightGreenBlue,
                          MyColors.hotGreenBlue,
                        ],
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomBackButton(),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/syringe.png'),
                                    width: 80,
                                  )))
                        ])),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Mechanism',
                      style: headerBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${this.vaccine.mechanism}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: MyColors.hotGreenBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: WhiteBox(
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.award,
                            size: 20,
                          ),
                          Text(' Candidate',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child:
                            _getStringColumn([this.vaccine.candidate], context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.vials,
                              size: 20,
                            ),
                            Text(' Sponsors',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _getStringColumn(this.vaccine.sponsors, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.flask,
                              size: 20,
                            ),
                            Text(' Institutions',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _getStringColumn(
                            this.vaccine.institutions, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.vial,
                              size: 20,
                            ),
                            Text(' Trial Phase',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _getStringColumn(
                            [this.vaccine.trialPhase], context),
                      ),
                    ],
                  ),
                ),
                WhiteBox(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bookReader,
                            size: 20,
                          ),
                          Text(' Details',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: _getStringColumn([this.vaccine.details], context),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _getStringColumn(List<String> list, BuildContext context) {
    return Column(
        children: list
            .map((str) => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Text(
                          '$str',
                          overflow: TextOverflow.clip,
                          maxLines: 1000,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                  ],
                ))
            .toList());
  }
}
