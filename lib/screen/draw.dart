import 'package:flutter/material.dart';
import 'package:cnss2/screen/liste_entreprise.dart';
import 'package:cnss2/screen/list_membre.dart';
import 'package:cnss2/screen/list_user.dart';
import 'package:cnss2/screen/bottom_nav_screen.dart';
import 'package:cnss2/screen/login.dart';
import 'package:cnss2/screen/list_contribution.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              "Liste d\'entreprises",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListeEntreprise()));
            },
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text(
              "Liste des membres",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListeMembre()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text(
              "Les contributions",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListeContribution()));
            },
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text(
              "Liste d'utilisateurs",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListeUser()));
            },
          ),
          ListTile(
            leading: Icon(Icons.keyboard_return),
            title: Text(
              "Se deconnecter",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
