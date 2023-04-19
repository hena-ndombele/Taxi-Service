import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_service/Utils/Constances.dart';
import 'package:taxi_service/vues/CodeValide.dart';





class NumeroTelephone extends StatelessWidget {
  const NumeroTelephone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children:<Widget> [
              Container(
                  child:Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                          child: Text(
                            'Saisissez votre numéro de',
                            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color:Utils.COLOR_BLUE, fontFamily: 'Schyler',),
                          ),),
                      ]
                  )),

              Container(
                child: Text(
                  ' téléphone',
                  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color:Utils.COLOR_BLUE, fontFamily: 'Schyler',),
                ),
              ),


              Container(
                padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                margin: EdgeInsets.all(12),
                child:IntlPhoneField(
                  cursorColor: Utils.COLOR_DORE,
                  decoration:InputDecoration(

                    hintText: 'Téléphone',hintStyle: TextStyle(fontFamily: 'Schyler'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Utils.COLOR_DORE,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  initialCountryCode: 'CD',
                ),
              ),


              SizedBox(height:10),


              //bouton continuer


              Container(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                        backgroundColor: Utils.COLOR_DORE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) => CodeValide()),
                      );


                    },
                    child: Text("Continuer",style: TextStyle(color:Utils.COLOR_BLUE,fontWeight: FontWeight.bold,fontSize: 19,fontFamily: 'Schyler'),),
                  ),
                ),
              ),
              SizedBox( height:20),
              Row(
                children: [
                  Expanded(child: Divider(
                    thickness: 0.5,
                    color:Colors.grey[400],
                  ),

                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("ou",style: TextStyle(color: Colors.grey[700],fontFamily: 'Schyler'),),
                  ),
                  Expanded(child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),

                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.white,
                          padding: EdgeInsets.all(20)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/google.png',height: 20,width: 20,),
                          SizedBox(width: 10,),
                          Text('Continuer avec Google',style: TextStyle(color:Utils.COLOR_NOIR,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Schyler'),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Color(0xFF576dff),
                          padding: EdgeInsets.all(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.facebook),
                          SizedBox(width: 10,),
                          Text('Continuer avec Facebook',style: TextStyle(color:Utils.COLOR_BLANCHE,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Schyler'),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: Column(
                  children: [
                    Text("En cliquant sur continuer,",style: TextStyle(color: Utils.COLOR_GREY,fontFamily: 'Schyler'),),
                    Text("un code sera envoyé par le numéro fourni",style: TextStyle(color: Utils.COLOR_GREY,fontFamily: 'Schyler'))
                  ],
                ),
              ),

            ]
        ),),

    );
  }
}


