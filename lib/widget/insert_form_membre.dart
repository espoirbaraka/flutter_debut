import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/url.dart';
import 'package:http/http.dart' as http;
import 'package:cnss2/screen/insert_membre.dart' as http;

class InsertForm extends StatefulWidget {
  @override
  _InsertFormState createState() => _InsertFormState();
}

class _InsertFormState extends State<InsertForm> {
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtpostnom = new TextEditingController();
  TextEditingController txtprenom = new TextEditingController();
  TextEditingController txtlieunaiss = new TextEditingController();
  TextEditingController txtdatenaiss = new TextEditingController();
  TextEditingController txtadresse = new TextEditingController();
  TextEditingController txtsalaire = new TextEditingController();
  TextEditingController txtnomconjoint = new TextEditingController();
  TextEditingController txtpostconjoint = new TextEditingController();
  TextEditingController id = TextEditingController();
  bool _isObscure = true;
  bool _isNumber = true;

  Future<void> Enregistrement() async {
    String url = Pub.chemin + "add_membre.php";
    var reponse = await http.post(Uri.parse(url), body: {
      "nom": txtnom.text,
      "postnom": txtpostnom.text,
      "prenom": txtprenom.text,
      "lieunaiss": txtlieunaiss.text,
      "salaire": txtsalaire.text,
      "nomconjoint": txtnomconjoint.text,
      "postnomconjoint": txtpostconjoint.text,
      //"code": widget.liste.id.toString(),
      //"code": design.text,
    });
    print(reponse);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          buildInputForm("Nom", false, txtnom),
          buildInputForm("Postnom", false, txtpostnom),
          buildInputForm("Prenom", false, txtprenom),
          buildInputForm("Lieu de naissance", false, txtlieunaiss),
          buildInputForm("Adresse", false, txtadresse),
          new TextField(
            controller: txtsalaire,
            decoration: InputDecoration(
              hintText: 'Salaire mensuel',
              labelText: 'Salaire mensuel',
            ),
            keyboardType: TextInputType.number,
            obscureText: false,
          ),
          buildInputForm("Nom conjoint", false, txtnomconjoint),
          buildInputForm("Postnom conjoint", false, txtpostconjoint),
          SizedBox(
            height: 20,
          ),
          // PrimaryButton(
          //   buttontext: "Se connecter",
          // ),
          Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 50,
              onPressed: () {
                Enregistrement();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ListeEntreprise(),
                //   ),
                // );
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
          ),
          SizedBox(
            height: 20,
          ),
          //SizedBox(height: height * 0.03),
        ],
      ),
    );
  }

  Padding buildInputForm(String label, bool pass, TextEditingController txt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      //padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: txt,
        obscureText: pass ? _isObscure : false,

        //keyboardType: numb ? _isNumber TextInputType.number ,
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
