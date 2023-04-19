import 'package:flutter/material.dart';
import 'package:taxi_service/vues/IdentiteComplet.dart';
import 'package:taxi_service/vues/Splashscreen.dart';
import 'package:taxi_service/Utils/Constances.dart';

import '../vues/EmailPage.dart';

class MonApplication extends StatelessWidget {
  const MonApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:AppBarTheme(
              iconTheme: IconThemeData(color:Utils.COLOR_BLUE)
          )
      ),
      home: Splashscreen(),
    );
  }
}
