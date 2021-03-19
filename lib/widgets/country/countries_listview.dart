import 'package:covid_count/models/country.dart';
import 'package:covid_count/routes/country_detail_route.dart';
import 'package:flutter/material.dart';

class CountriesListView extends StatelessWidget {
  final List<Country> countries;
  final Function getData;

  const CountriesListView({Key key, this.countries, this.getData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 410,
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
                                  builder: (context) => CountryDetail(
                                    country: countries[index],
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
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          countries[index]
                                                              .flag)))),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      130,
                                                  child: Text(
                                                    countries[index].country,
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
                                                vertical: 8),
                                            child: Row(children: [
                                              Text(
                                                'Total Cases: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text('${countries[index].cases}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.pink.shade400))
                                            ])),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Row(children: [
                                              Text(
                                                'Last 24h:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ])),
                                        Row(children: [
                                          Text('Case: ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                          Text('${countries[index].todayCases}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.pink.shade400)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text('Death: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Text(
                                              '${countries[index].todayDeaths}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.pink.shade400)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text('Recover: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Text(
                                              '${countries[index].todayRecovered}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.pink.shade400))
                                        ])
                                      ])))))),
                  itemCount: this.countries.length),
            )));
  }
}
