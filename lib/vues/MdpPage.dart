import 'package:flutter/material.dart';
import 'package:taxi_service/Utils/Constances.dart';
import 'package:taxi_service/vues/IdentiteComplet.dart';


class Mdp extends StatefulWidget {
  const Mdp({Key? key}) : super(key: key);
  @override
  State<Mdp> createState() => _MdpState();
}

class _MdpState extends State<Mdp> {
  final _formkey=GlobalKey<FormState>();

  RegExp pass_valid=RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass){
    String _password = pass.trim();

    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
  }
  //affichage mot de passe
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Text(
          "Saisissez votre mot de passe",
          style: TextStyle(
              color: Utils.COLOR_BLUE,
              fontFamily: 'Schyler',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Le mot de passe doit comporter 8 caratecres '
                            'maximum, dont au moins une lettre Majuscule,une lettre miniscule, '
                            'un chiffres et un caractère spéciaux.',style: TextStyle(color:Utils.COLOR_GREY, fontFamily: 'Schyler',),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Form(
                      key:_formkey,
                      child: TextFormField(
                        maxLength: 8,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Veuillez entrer un mot de passe";
                          }else{
                            bool result=validatePassword(value);
                            if (result){
                              return null;
                            }else{
                              return "Mot de passe Incorrect";
                            }
                          }
                        },

                        obscureText: !obscureText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              icon: Icon(
                                obscureText ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Utils.COLOR_DORE,
                              )),
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(fontFamily: 'Schyler'),
                          hintText: 'Mot de passe',
                          hintStyle: TextStyle(fontFamily: 'Schyler'),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Utils.COLOR_DORE,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Utils.COLOR_BLUE,
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
                          EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),

                        ),

                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 140,
              ),
              //bouton je valide
              Container(
                child: SizedBox(
                  width: 290,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Utils.COLOR_DORE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () async {
                      FocusScope.of(context).requestFocus(new FocusNode()); //disparition clavier

                      if(_formkey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => IdentiteComplet()),
                        );

                      }else{
                        print("Mot de passe incorrect");
                      }

                    },
                    child: Text(
                      "je valide",
                      style: TextStyle(
                          color: Utils.COLOR_BLUE,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
