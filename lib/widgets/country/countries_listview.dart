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
    var titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    var valueStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.pink.shade400);

    return Container(
      height: MediaQuery.of(context).size.height - 340,
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
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
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
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(countries[index].flag),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          130,
                                      child: Text(
                                        countries[index].country,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      'Total Cases: ',
                                      style: titleStyle,
                                    ),
                                    Text(
                                      '${countries[index].cases}',
                                      style: valueStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Row(children: [
                                Text(
                                  'Last 24h:',
                                  style: titleStyle,
                                )
                              ]),
                              Row(
                                children: [
                                  Text('Case: ', style: titleStyle),
                                  Text(
                                    '${countries[index].todayCases}',
                                    style: valueStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text('Death: ', style: titleStyle),
                                  ),
                                  Text(
                                    '${countries[index].todayDeaths}',
                                    style: valueStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text('Recover: ', style: titleStyle),
                                  ),
                                  Text(
                                    '${countries[index].todayRecovered}',
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
              itemCount: this.countries.length),
        ),
      ),
    );
  }
}
