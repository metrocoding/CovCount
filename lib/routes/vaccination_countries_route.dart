import 'package:covid_count/models/vaccination.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/routes/vaccination_country_history.dart';
import 'package:covid_count/utility/util.dart';
import 'package:covid_count/widgets/back_button.dart';
import 'package:flutter/material.dart';

class VaccinationCountryRoute extends StatelessWidget {
  final List<Vaccination> vaccinatedList;
  final String title;

  const VaccinationCountryRoute({Key key, this.vaccinatedList, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    var valueStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: MyColors.background),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        MyColors.lightGreen,
                        MyColors.hotGreen,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomBackButton(title),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 115,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: vaccinatedList.length,
                    itemBuilder: (context, index) => Material(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VaccinationCountryHistoryRoute(
                              vaccinateDetail: this.vaccinatedList[index],
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    vaccinatedList[index].location,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Total: ',
                                          style: titleStyle,
                                        ),
                                        Text(
                                          '${Util.toNumericFormat(vaccinatedList[index].data.last.totalVaccinations)} - ${vaccinatedList[index].data.last.totalVaccinationsPerHundred}%',
                                          style: valueStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'People Vaccinated: ',
                                        style: titleStyle,
                                      ),
                                      Text(
                                        '${Util.toNumericFormat(vaccinatedList[index].data.last.peopleVaccinated)} - ${vaccinatedList[index].data.last.peopleVaccinatedPerHundred}%',
                                        style: valueStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Fully Vaccinated: ',
                                        style: titleStyle,
                                      ),
                                      Text(
                                        '${Util.toNumericFormat(vaccinatedList[index].data.last.peopleFullyVaccinated)} - ${vaccinatedList[index].data.last.peopleFullyVaccinatedPerHundred}%',
                                        style: valueStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
