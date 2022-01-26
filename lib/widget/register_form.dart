import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm("Nom", false),
        buildInputForm("Postnom", false),
        buildInputForm("Prenom", false),
        buildInputForm("Username", false),
        buildInputForm("Password", true),
      ],
    );
  }

  Padding buildInputForm(String label, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
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
