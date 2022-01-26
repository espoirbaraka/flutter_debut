import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/screen/home_screen.dart';
import 'package:cnss2/screen/liste_entreprise.dart';
import 'package:cnss2/url.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class InsertForm extends StatefulWidget {
  @override
  _InsertFormState createState() => _InsertFormState();
}

class _InsertFormState extends State<InsertForm> {
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtsiege = new TextEditingController();
  bool _isObscure = true;

  Future<void> Enregistrement() async {
    String url = Pub.chemin + "add_entreprise.php";
    var reponse = await http.post(Uri.parse(url), body: {
      "nom": txtnom.text,
      "siege": txtsiege.text,
    });
    print(reponse);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          buildInputForm("Nom de l'entreprise", false, txtnom),
          buildInputForm("Siege", false, txtsiege),
          SizedBox(
            height: 20,
          ),
          // PrimaryButton(
          //   buttontext: "Se connecter",
          // ),
          Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,

                  height: 50,
                  onPressed: () {
                    Enregistrement();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListeEntreprise(),
                      ),
                    );
                    //HomeScreen();
                  },
                  // color: Color(0xff0095FF),
                  color: Palette.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Padding buildInputForm(String label, bool pass, TextEditingController txt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      //padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: txt,
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: kPrimaryColor,
                    ),
                  )
                : null),
      ),
    );
  }
}
