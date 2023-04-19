import 'package:flutter/material.dart';
import 'package:taxi_service/vues/NumeroTelephone.dart';
import 'package:taxi_service/vues/NumeroTelephone.dart';
import 'package:taxi_service/vues/EmailPage.dart';
import 'package:taxi_service/Utils/Constances.dart';


class CodeValide extends StatefulWidget {
  const CodeValide({Key? key}) : super(key: key);

  @override
  State<CodeValide> createState() => _CodeValideState();
}

class _CodeValideState extends State<CodeValide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Container(
                margin: EdgeInsets.all(30),
                child:   Text("Saisissez le code à 4 chiffres envoyé par SMS",style: TextStyle(fontSize: 28,color:Utils.COLOR_BLUE,fontWeight: FontWeight.bold,fontFamily: 'Schyler'),
                )
            ),

            GestureDetector(
              child: Text(
                "Modifier mon numéro de téléphone",
                style:  TextStyle(color:Utils.COLOR_DORE,fontWeight: FontWeight.bold,fontFamily: 'Schyler',decoration: TextDecoration.underline),),
              onTap: (){
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder:(context) => NumeroTelephone()),
                );

              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(27),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textFieldOTP(first:true,  last:false),
                      _textFieldOTP(first:false, last:false),
                      _textFieldOTP(first:false, last:false),
                      _textFieldOTP(first:false, last:false),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => EmailPage()),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Utils.COLOR_BLANCHE),
                        backgroundColor: MaterialStateProperty.all<Color>(Utils.COLOR_DORE),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),)
                        ),
                      ),
                      child: Padding(

                        padding: EdgeInsets.all(12),
                        child: Text('Vérifier',style: TextStyle(fontSize: 17,color: Utils.COLOR_BLUE,fontWeight: FontWeight.bold,fontFamily: 'Schyler')),
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 100,),

            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Renvoyer le code",style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                          color: Utils.COLOR_BLUE),)
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),

    );

  }

  _textFieldOTP({bool? first, last}){
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value){
            if (value.length == 1 && last ==false){
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && last ==false){
              FocusScope.of(context).previousFocus();
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter:Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2,color:Utils.COLOR_DORE),
                  borderRadius: BorderRadius.circular(12)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2,color:Utils.COLOR_BLUE),
                borderRadius: BorderRadius.circular(12),
              )
          ),
        ),
      ),
    );
  }


}
