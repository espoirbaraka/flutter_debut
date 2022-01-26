import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';
import 'package:cnss2/url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cnss2/screen/home_screen.dart';
import 'package:cnss2/screen/dashboard1.dart';
import 'package:cnss2/config/palette.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _isObscure = true;

  Future login() async {
    String url = Pub.chemin + "connect.php";
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      // FlutterToast(context).showToast(
      //     child: Text(
      //   'Login Successful',
      //   style: TextStyle(fontSize: 25, color: Colors.green),
      // ));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard1(),
        ),
      );
    } else {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LogInForm(),
      //   ),
      // );
      // FlutterToast(context).showToast(
      //     child: Text('Username and password invalid',
      //         style: TextStyle(fontSize: 25, color: Colors.red)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm("Username", false, username),
        buildInputForm("Password", true, password),
        SizedBox(
          height: 20,
        ),
        Text(
          "Mot de passe oublié",
          style: TextStyle(
            color: kZambeziColor,
            fontSize: 14,
            decoration: TextDecoration.underline,
            //decorationThickness: 1,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          minWidth: double.infinity,
          height: 50,
          onPressed: () {
            login();
          },
          color: Palette.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Text(
            "Se connecter",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Padding buildInputForm(String label, bool pass, TextEditingController txt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      //padding: const EdgeInsets.all(20.0),
      child: TextFormField(
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
