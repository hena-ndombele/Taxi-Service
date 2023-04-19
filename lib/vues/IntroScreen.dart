import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:taxi_service/Utils/Constances.dart';

import 'NumeroTelephone.dart';



class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: IntroductionScreen(
          globalBackgroundColor:Utils.COLOR_BLANCHE,
          scrollPhysics: BouncingScrollPhysics(),
          pages: [
            PageViewModel(
                titleWidget: const Text(
                  "Taxi Service",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color:Utils.COLOR_BLUE,
                      fontFamily: 'Schyler'
                    // color: Color.fromRGBO(158, 79, 194, 0)
                  ),
                ),
                body:
                "Commander Taxi Service pour tous vos courses à partir de chez vous grace à votre téléphone mobile.",
                image: Image.asset(
                  "images/taxi1.jpg",
                  height: 400,
                  width: 600,
                )),
            PageViewModel(
                titleWidget: const Text(
                  "Sécurisez-vous et sécurisez vos proches",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Schyler',
                    color:Utils.COLOR_BLUE,
                  ),
                ),
                body:
                "La meilleur façon de se déplacer vous et votre famille sans risque 24h/24h.",
                image: Image.asset(
                  "images/taxi2.jpg",
                  height: 400,
                  width: 400,
                )),
            PageViewModel(
                titleWidget: const Text(
                  "Evitez les embouteillages",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color:Utils.COLOR_BLUE,
                    fontFamily: 'Schyler',
                  ),
                ),
                body:
                "Déplacez-vous plus rapidement grace à Taxi Service",
                image: Image.asset(
                  "images/taxi3.jpeg",
                  height: 800,
                  width: 800,
                )),
          ],
          onDone: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder:(context) => NumeroTelephone()),
            );
          },
          next: const Icon(
            Icons.arrow_forward,
            color: Utils.COLOR_DORE,
          ),
          done: Container(
            child: Text(
              "Commencer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Utils.COLOR_DORE,
                fontFamily: 'Schyler',
              ),
            ),
          ),
          dotsDecorator: DotsDecorator(
              size: Size.square(7.0),
              activeSize: Size(15.0, 10.0),
              color: Colors.black26,
              activeColor: Utils.COLOR_DORE,
              spacing: EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              )),
        ),
      ),
    );
  }
}