import 'package:flutter/material.dart';
import 'package:taxi_service/Utils/Constances.dart';


class ReinitialiserPassword extends StatefulWidget {
  const ReinitialiserPassword({Key? key}) : super(key: key);

  @override
  State<ReinitialiserPassword> createState() => _ReinitialiserPasswordState();
}

class _ReinitialiserPasswordState extends State<ReinitialiserPassword> {

  final _form=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Text('Réinitialiser le mot de passe',style: TextStyle(color: Utils.COLOR_BLUE,fontFamily: 'Schyler',fontWeight: FontWeight.bold),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.fromLTRB(7.0, 20.0, 0.0, 0.0),
              margin: EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Ce champ est obligatoire*';
                    }
                    if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                      return 'Entrez une addresse valide';
                    }
                    return null;
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Utils.COLOR_DORE,
                    ),
                    labelText: 'Email',labelStyle: TextStyle(fontFamily: 'Schyler'),
                    hintText: 'Email',hintStyle: TextStyle(fontFamily: 'Schyler'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Utils.COLOR_DORE,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                        Utils.COLOR_BLUE,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Utils.COLOR_NOIR,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Utils.COLOR_NOIR,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    contentPadding:
                    EdgeInsetsDirectional.fromSTEB(
                        16, 24, 0, 24),
                  ),

                ),
              ),

            ),

            SizedBox(height:110),
            Container(
              padding: EdgeInsets.fromLTRB(7.0, 50.0, 0.0, 0.0),
              child: SizedBox(
                width: 290,
                height: 60,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: Utils.COLOR_DORE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  onPressed: (){},
                  child: Text("Réinitialiser mon mot de passe",style: TextStyle(color:Utils.COLOR_BLUE,fontWeight: FontWeight.bold,fontSize: 17),),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(30),
              child: Column(

                children: [
                  Center(
                    child:Text("Entrez votre adresse email,",style: TextStyle(color: Utils.COLOR_GREY,fontFamily: 'Schyler'),),
                  ),
                  Center(
                      child:Text("pour recevoir un lien de récupération ",style: TextStyle(color: Utils.COLOR_GREY,fontFamily: 'Schyler'))),
                  Center(
                      child:Text("de votre compte.",style: TextStyle(color: Utils.COLOR_GREY,fontFamily: 'Schyler'))),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
