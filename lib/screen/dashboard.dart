import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("DASHBOARD"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      drawer: new Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text(
              "Username",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            accountEmail: new Text("email@gmail.com"),
            //currentAccountPicture: AssetImage("assets/welcome.png"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Ajouter un membre"),
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text("Liste des membres"),
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Effectuer un depot"),
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Liste des pensionnés"),
          ),
          ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Payement des pensionnés"),
          ),
        ],
      )),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(
              title: "Home",
              icon: Icons.account_balance,
              warna: Colors.brown,
            ),
            MyMenu(
              title: "Info",
              icon: Icons.info_outline,
              warna: Colors.blue,
            ),
            MyMenu(
              title: "Home",
              icon: Icons.school,
              warna: Colors.orange,
            ),
            MyMenu(
              title: "Home",
              icon: Icons.person_pin,
              warna: Colors.blueGrey,
            ),
            MyMenu(
              title: "Home",
              icon: Icons.local_library,
              warna: Colors.red,
            ),
            MyMenu(
              title: "Home",
              icon: Icons.library_books,
              warna: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.warna});
  final String title;
  final IconData icon;
  final MaterialColor warna;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title,
                  style: new TextStyle(
                    fontSize: 17.0,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
