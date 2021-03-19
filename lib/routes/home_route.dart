import 'dart:convert';

import 'package:covid_count/enum/ConnectionStatus.dart';
import 'package:covid_count/models/country.dart';
import 'package:covid_count/models/therapeutic.dart';
import 'package:covid_count/models/vaccine.dart';
import 'package:covid_count/models/world.dart';
import 'package:covid_count/resource/colors.dart';
import 'package:covid_count/routes/about_us_route.dart';
import 'package:covid_count/routes/countries_route.dart';
import 'package:covid_count/routes/therapeutic_route.dart';
import 'package:covid_count/routes/vaccine_route.dart';
import 'package:covid_count/widgets/connection_error.dart';
import 'package:covid_count/widgets/waiting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  int _selectedIndex = 2;
  ConnectionStatus _connectionStatus = ConnectionStatus.Error;
  List<Country> _countryList = [];
  List<Vaccine> _vaccineList = [];
  List<Therapeutic> _therapeuticList = [];
  World _world;

  List<Widget> _pages = <Widget>[
    VaccineRoute([], () {}),
    CountriesRoute([], null, () {}),
    AboutUsRoute()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: MyColors.background,
        items: <Widget>[
          FaIcon(FontAwesomeIcons.syringe,
              size: 30,
              color: _selectedIndex != 0
                  ? MyColors.iconDisable
                  : MyColors.hotGreen),
          Padding(
            padding: const EdgeInsets.all(3),
            child: FaIcon(FontAwesomeIcons.prescriptionBottleAlt,
                size: 28,
                color: _selectedIndex != 1
                    ? MyColors.iconDisable
                    : MyColors.hotBlue),
          ),
          FaIcon(FontAwesomeIcons.virus,
              size: 30,
              color: _selectedIndex != 2 ? MyColors.iconDisable : Colors.pink),
          FaIcon(FontAwesomeIcons.infoCircle,
              size: 30,
              color: _selectedIndex != 3
                  ? MyColors.iconDisable
                  : MyColors.hotPurple)
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        color: Colors.white,
        index: _selectedIndex,
        animationCurve: Curves.fastLinearToSlowEaseIn,
      ),
      body: _connectionStatus == ConnectionStatus.Succeeded
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: _pages.elementAt(_selectedIndex),
              switchInCurve: Curves.fastLinearToSlowEaseIn,
              switchOutCurve: Curves.fastLinearToSlowEaseIn,
            )
          : _connectionStatus == ConnectionStatus.Started
              ? StartWaiting()
              : _connectionStatus == ConnectionStatus.Error
                  ? ConnectionError(_getData)
                  : Text(''),
    );
  }

  Future<void> _getData() async {
    try {
      setState(() {
        _connectionStatus = ConnectionStatus.Started;
      });

      Response responseCountry =
          await http.get(Uri.https('disease.sh', 'v3/covid-19/countries'));
      Response responseVaccine =
          await http.get(Uri.https('disease.sh', 'v3/covid-19/vaccine'));
      Response responseWorld =
          await http.get(Uri.https('disease.sh', 'v3/covid-19/all'));
      Response responseTherapeutic =
          await http.get(Uri.https('disease.sh', 'v3/covid-19/therapeutics'));

      if (responseCountry.statusCode != 200 ||
          responseVaccine.statusCode != 200 ||
          responseWorld.statusCode != 200 ||
          responseTherapeutic.statusCode != 200) {
        setState(() {
          _connectionStatus = ConnectionStatus.Error;
        });
      } else {
        var iterableCountries = json.decode(responseCountry.body);
        var iterableVaccines = json.decode(responseVaccine.body);
        var iterableTherapeutics = json.decode(responseTherapeutic.body);
        _world = World.fromJson(json.decode(responseWorld.body));

        setState(() {
          _countryList = List<Country>.from(
              iterableCountries.map((model) => Country.fromJson(model)));
          _countryList.sort((a, b) => b.cases.compareTo(a.cases));

          _vaccineList = List<Vaccine>.from(
              iterableVaccines['data'].map((model) => Vaccine.fromJson(model)));

          _therapeuticList = List<Therapeutic>.from(iterableTherapeutics['data']
              .map((model) => Therapeutic.fromJson(model)));

          _pages = <Widget>[
            VaccineRoute(_vaccineList, _getData),
            TherapeuticRoute(_therapeuticList, _getData),
            CountriesRoute(_countryList, _world, _getData),
            AboutUsRoute()
          ];

          _connectionStatus = ConnectionStatus.Succeeded;
        });
      }
    } catch (exception) {
      setState(() {
        _connectionStatus = ConnectionStatus.Error;
      });
    }
  }
}
