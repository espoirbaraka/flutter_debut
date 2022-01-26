import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/screen/list_user.dart';
import 'package:cnss2/url.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class FormUtilisateur extends StatefulWidget {
  @override
  _FormUtilisateurState createState() => _FormUtilisateurState();
}

class _FormUtilisateurState extends State<FormUtilisateur> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _isObscure = true;

  Future<void> Enregistrement() async {
    String url = Pub.chemin + "add_user.php";
    var reponse = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
    });
    print(reponse);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          buildInputForm("Username", false, username),
          buildInputForm("Password", true, password),
          SizedBox(
            height: 20,
          ),
          // PrimaryButton(
          //   buttontext: "Se connecter",
          // ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            onPressed: () {
              Enregistrement();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListeUser(),
                ),
              );
            },
            // color: Color(0xff0095FF),
            color: Palette.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Text(
              "Inserer",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
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
