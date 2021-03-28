import 'package:covid_count/config/config.dart';
import 'package:covid_count/models/vaccine.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/routes/vaccine_detail_route.dart';
import 'package:flutter/material.dart';

class VaccineList extends StatelessWidget {
  final List<Vaccine> vaccines;
  final Function getData;

  const VaccineList({Key key, this.vaccines, this.getData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = Config.titleStyle;
    var valueStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: MyColors.hotGreenBlue);

    return Container(
      height: MediaQuery.of(context).size.height - 295,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          color: Colors.blue,
          onRefresh: getData,
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Material(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VaccineDetail(
                      vaccine: vaccines[index],
                    ),
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/syringe.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 130,
                                child: Text(
                                  vaccines[index].sponsors[0],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Candidate: ',
                                style: titleStyle,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                child: Text(
                                  '${vaccines[index].candidate}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: valueStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Trial phase: ',
                              style: titleStyle,
                            ),
                            Text(
                              '${vaccines[index].trialPhase}',
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
            itemCount: this.vaccines.length,
          ),
        ),
      ),
    );
  }
}
