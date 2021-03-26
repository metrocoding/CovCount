import 'package:covid_count/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(new MaterialApp(
    theme: ThemeData(fontFamily: 'SourceSansPro'),
    home: HomePage(),
  ));
}
