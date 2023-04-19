import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taxi_service/vues/IntroScreen.dart';
import 'package:taxi_service/Utils/Constances.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:(context) => IntroScreen()),
      );
    });
  }



  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Utils.COLOR_DORE,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image:AssetImage("images/logo.png"),
                width: 300,
              ),
              SizedBox(height: 50,),
              CupertinoActivityIndicator(
                color: Utils.COLOR_BLUE,
                radius:30.0,
              )

            ],
          ),
        )

    );
  }
}




