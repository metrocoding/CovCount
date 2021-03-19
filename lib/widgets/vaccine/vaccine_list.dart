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
    return Container(
        height: MediaQuery.of(context).size.height - 350,
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
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 7),
                              child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        Row(children: [
                                          Container(
                                              height: 30,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/syringe.png')))),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      130,
                                                  child: Text(
                                                    vaccines[index].sponsors[0],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    softWrap: true,
                                                  )))
                                        ]),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Candidate: ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      150,
                                                  child: Text(
                                                      '${vaccines[index].candidate}',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: MyColors
                                                              .hotGreen)),
                                                ),
                                              ]),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(children: [
                                            Text('Trial phase: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                '${vaccines[index].trialPhase}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyColors.hotGreen)),
                                          ]),
                                        )
                                      ])))))),
                  itemCount: this.vaccines.length),
            )));
  }
}
