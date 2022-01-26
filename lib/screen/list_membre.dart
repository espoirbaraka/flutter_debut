import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cnss2/url.dart';
import 'package:cnss2/screen/draw.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/screen/cotiser.dart';

class ListeMembre extends StatefulWidget {
  final User liste;
  final int index;
  ListeMembre({this.liste, this.index});
  @override
  _ListeMembreState createState() => _ListeMembreState();
}

class _ListeMembreState extends State<ListeMembre> {
  bool _isLoading = false;

  //final UrlImage = "assets/job.jpg";
  List<User> myData;
  Future<List<User>> _getUsers() async {
    setState(() {
      _isLoading = true;
    });
    String url = Pub.chemin + "get_membre.php";
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(
          int.parse(u["CodeMembre"]),
          u["NomMembre"],
          u["PostnomMembre"],
          u["PrenomMembre"],
          u["DesignationEntreprise"],
          u["SalaireMembre"],
          u["Solde"]);
      users.add(user);
    }
    setState(() {
      _isLoading = false;
    });
    print(users.length);
    print(users);

    return users;
  }

  @override
  void initState() {
    super.initState();
    _getMyValues();
  }

  _getMyValues() async {
    myData = await _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Palette.primaryColor,
        title: new Text("LISTE DES MEMBRES DE LA CNSS"),
      ),
      drawer: DrawScreen(),
      body: Container(
          child: myData != null
              ? ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(' '),
                      ),
                      title: Text(
                        myData[index].nom +
                            " " +
                            myData[index].postnom +
                            " " +
                            myData[index].prenom +
                            " (Salaire: " +
                            myData[index].salaire +
                            "\$ )",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Agent de: " +
                          myData[index].entreprise +
                          " / Montant 3% : " +
                          myData[index].salaire +
                          " / Solde: " +
                          myData[index].solde +
                          "\$"),
                      // leading: GestureDetector(
                      //   child: Icon(Icons.edit),
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //   context,
                      //     //   // MaterialPageRoute(
                      //     //   //   builder: (context) => AddEditPage(
                      //     //   //         list: myData[index],
                      //     //   //         index: index,
                      //     //   //       ),
                      //     //   // ),
                      //     // );
                      //     debugPrint('Edit Clicked');
                      //   },
                      // ),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            String url = Pub.chemin + "delete_membre.php";
                            // print(body);
                            http.post(url, body: {
                              'id': myData[index].id.toString(),
                            });
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListeMembre(),
                            ),
                          );
                          debugPrint('delete Clicked');
                        },
                      ),

                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Cotiser(
                                      liste: myData[index],
                                      index: index,
                                    )));
                      },
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.nom),
      ),
      body: Text(user.postnom),
    );
  }
}

class User {
  final int id;
  final String nom;
  final String postnom;
  final String prenom;
  final String entreprise;
  final String salaire;
  final String solde;

  User(this.id, this.nom, this.postnom, this.prenom, this.entreprise,
      this.salaire, this.solde);
}
// class User {
//   final int id;
//   final String title;
//   final String url;

//   User(this.id, this.title, this.url);
// }
