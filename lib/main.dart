import 'package:cnss2/login.dart';
import 'package:cnss2/register.dart';
import 'package:cnss2/screen/login.dart';
import 'package:cnss2/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:cnss2/config/palette.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Bienvenu à la CNSS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "La caisse Nationale de la Sécurité Sociale a pour objectif d'aider à tout les travailleurs congolais de garantir leurs vie professionnelles",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/welcome.png"))),
                  ),
                  Column(
                    children: <Widget>[
                      //Padding: EdgeInsets.all(20);
                      //BOUTON LOGIN
                      //return Container(),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },

                        //la forme
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),

                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),

                      //BOUTON ENREGISTREMENT
                      SizedBox(height: 20),

                      MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        color: Palette.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Inscription",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
