import 'package:covid_count/models/therapeutic.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/back_button.dart';
import 'package:covid_count/widgets/country/detail/white_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TherapeuticDetail extends StatelessWidget {
  final Therapeutic therapeutic;

  const TherapeuticDetail({Key key, this.therapeutic}) : super(key: key);

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
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(color: MyColors.hotBlue),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomBackButton(),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/medicine.png'),
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                  )))
                        ])),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Medication Class',
                      style: headerBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${this.therapeutic.medicationClass}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: MyColors.hotBlue,
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
                            FontAwesomeIcons.trademark,
                            size: 20,
                          ),
                          Text(' Trade Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _getStringColumn(
                            this.therapeutic.tradeName, context),
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
                        child: _getStringColumn(
                            this.therapeutic.sponsors, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.flask,
                              size: 20,
                            ),
                            Text(' Developer Researcher',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _getStringColumn(
                            this.therapeutic.developerResearcher, context),
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
                            [this.therapeutic.trialPhase], context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendarTimes,
                              size: 20,
                            ),
                            Text(' Last Update',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _getStringColumn(
                            [this.therapeutic.lastUpdate], context),
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
                      child:
                          _getStringColumn([this.therapeutic.details], context),
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
