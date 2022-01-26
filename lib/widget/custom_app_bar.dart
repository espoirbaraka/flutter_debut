import 'package:flutter/material.dart';
import 'package:cnss2/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // return Drawer(
    //     child: ListView(
    //   children: <Widget>[
    //     UserAccountsDrawerHeader(
    //       accountName: new Text(
    //         "Username",
    //         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
    //       ),
    //       accountEmail: new Text("email@gmail.com"),
    //       //currentAccountPicture: AssetImage("assets/welcome.png"),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.person),
    //       title: Text("Profil"),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.add),
    //       title: Text("Ajouter un membre"),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.person_pin),
    //       title: Text("Liste des membres"),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.money_off),
    //       title: Text("Effectuer un depot"),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.money_off),
    //       title: Text("Liste des pensionnés"),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.money_off),
    //       title: Text("Payement des pensionnés"),
    //     ),
    //   ],
    // ));

    // return AppBar(
    //   backgroundColor: Palette.primaryColor,
    //   elevation: 0.0,
    //   leading: IconButton(
    //     icon: const Icon(Icons.menu),
    //     iconSize: 28.0,
    //     onPressed: () {},
    //   ),

    //   actions: <Widget>[
    //     IconButton(
    //       icon: const Icon(Icons.notifications_none),
    //       iconSize: 28.0,
    //       onPressed: () {},
    //     ),
    //   ],
    // );

    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   iconSize: 28.0,
      //   onPressed: () {},
      // ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
