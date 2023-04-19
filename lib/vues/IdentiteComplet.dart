import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_service/Utils/Constances.dart';
import 'package:taxi_service/vues/GoogleMaps.dart';


class IdentiteComplet extends StatefulWidget {
  const IdentiteComplet({Key? key}) : super(key: key);

  @override
  State<IdentiteComplet> createState() => _IdentiteCompletState();
}

class _IdentiteCompletState extends State<IdentiteComplet> {

final _formkey = GlobalKey<FormState>();
AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

String? _prenom;
String? _nom;

void _validateInputs(){
  if(_formkey.currentState!.validate()){
    _formkey.currentState!.save();
  }else{
    setState(() {
      _autovalidateMode=AutovalidateMode.always;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Text("Saisissez votre nom complet",style: TextStyle(color:Utils.COLOR_BLUE,fontFamily: 'Schyler',fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: 160,
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: validatePrenom,
                      onSaved: (String? val){
                        _nom=val;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: Utils.COLOR_DORE,
                        ),
                        labelText: 'Prénom',labelStyle: TextStyle(fontFamily: 'Schyler'),
                        hintText: 'Prénom',hintStyle: TextStyle(fontFamily: 'Schyler'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Utils.COLOR_DORE,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Utils.COLOR_BLUE,
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
                            color: Utils.COLOR_BLUE,
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
                Container(
                  margin: EdgeInsets.all(15),
                  width: 160,
                  child: Form(

                    child: TextFormField(
                      key: _formkey,
                      keyboardType: TextInputType.text,
                      validator: validateNom,
                      onSaved: (String? val){
                        _nom=val;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: Utils.COLOR_DORE,
                        ),
                        labelText: 'Nom',labelStyle: TextStyle(fontFamily: 'Schyler'),
                        hintText: 'Nom',hintStyle: TextStyle(fontFamily: 'Schyler'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Utils.COLOR_DORE,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Utils.COLOR_BLUE,
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
                            color: Utils.COLOR_DORE,
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
              ],
            ),
            Column(
              children: [
                Text("votre nom complet sera visible dans l'application",style: TextStyle(color: Utils.COLOR_GREY,fontFamily: 'Schyler'),),
              ],
            ),

            SizedBox(height: 200,),
            Container(
              child: SizedBox(
                width: 290,
                height: 55,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: Utils.COLOR_DORE,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                  onPressed: (){
                    FocusScope.of(context).requestFocus(new FocusNode()); //disparition clavier

                    if(_formkey.currentState!.validate()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) =>GoogleMaps()),
                      );

                    }else{
                      print("votre addresse e-mail est incorrect");
                    }
                  },
                  child: Text("C'est tout",style: TextStyle(color:Utils.COLOR_BLUE,fontWeight: FontWeight.bold,fontSize: 19,fontFamily: 'Schyler'),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }





  String? validatePrenom(String? value){
    if(value == null || value.isEmpty){
      return 'Ce champ est obligatoire*';
    }
  if(value.length < 3){
    return '2 caractere';
  }else{
    return null;
  }
  }

 String? validateNom(String? value){
   if(value!.isEmpty){
    return 'prenom incorrect';
  }


    if(value.length < 3){
    return '2 caractere';
  }else{
    return null;
  }
}
}
