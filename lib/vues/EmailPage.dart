import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxi_service/Utils/Constances.dart';
import 'package:taxi_service/vues/MdpPage.dart';


class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {


  final _form=GlobalKey<FormState>();
  bool _isValid=false;

  void _saveForm(){
    setState(() {
      _isValid= _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white38,
          elevation: 0,
          title: Text("Saisissez votre adresse email",style: TextStyle(color:Utils.COLOR_BLUE,fontFamily: 'Schyler',fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Column(
              children:<Widget> [
                SizedBox(height: 30),
                Container(
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
                SizedBox(height: 50,),
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
                      onPressed: () async{
                        FocusScope.of(context).requestFocus(new FocusNode()); //disparition clavier

                        if(_form.currentState!.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context) => Mdp()),
                          );

                        }else{
                          print("votre addresse e-mail est incorrect");
                        }
                      },
                      child: Text("Continuer",style: TextStyle(color:Color(0xFF130f48),fontWeight: FontWeight.bold,fontSize: 19,fontFamily: 'Schyler'),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Utils.COLOR_BLANCHE,
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
                            Text('Continuer avec Facebook',style: TextStyle(fontFamily: 'Schyler',color:Utils.COLOR_BLANCHE,fontSize: 16,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ]
          ),)
    );
  }
}
