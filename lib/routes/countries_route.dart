import 'package:covid_count/models/country.dart';
import 'package:covid_count/models/world.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/widgets/country/contry_list_header.dart';
import 'package:covid_count/widgets/country/countries_listview.dart';
import 'package:flutter/material.dart';

class CountriesRoute extends StatelessWidget {
  final List<Country> countries;
  final World world;
  final Function getData;

  const CountriesRoute(this.countries, this.world, this.getData);

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
                          CountryListHeader(world),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 40, 20, 10),
                            child: Text(
                              'Latest Update By Country',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          CountriesListView(
                            countries: countries,
                            getData: getData,
                          )
                        ])))));
  }
}
