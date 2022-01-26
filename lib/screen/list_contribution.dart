import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cnss2/url.dart';
import 'package:cnss2/screen/edit_user.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/screen/draw.dart';

class ListeContribution extends StatefulWidget {
  @override
  _ListeContributionState createState() => _ListeContributionState();
}

class _ListeContributionState extends State<ListeContribution> {
  bool _isLoading = false;

  final UrlImage = "assets/job.jpg";
  List<User> myData;
  Future<List<User>> _getUsers() async {
    setState(() {
      _isLoading = true;
    });
    String url = Pub.chemin + "get_contribution.php";
    var data = await http.get(url);
    var jsonData = json.decode(data.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(int.parse(u["CodeContribution"]), u["Montant"],
          u["NomMembre"], u["PostnomMembre"], u["PrenomMembre"]);
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
        title: new Text("LISTE DES CONTRIBUTIONS"),
      ),
      drawer: DrawScreen(),
      body: Container(
          child: myData != null
              ? ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(UrlImage),
                      ),
                      title: Text(
                        myData[index].nom +
                            ' ' +
                            myData[index].postnom +
                            ' ' +
                            myData[index].prenom,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Montant: " + myData[index].montant),
                      // leading: GestureDetector(
                      //   child: Icon(Icons.edit),
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //     builder: (context) => AddEditPage(
                      //     //           list: myData[index],
                      //     //           index: index,
                      //     //         ),
                      //     //   ),
                      //     // );
                      //     debugPrint('Edit Clicked');
                      //   },
                      // ),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            String url = Pub.chemin + "delete_user.php";
                            // print(body);
                            http.post(url, body: {
                              'id': myData[index].id.toString(),
                            });
                          });
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ListeUser(),
                          //   ),
                          // );
                          debugPrint('delete Clicked');
                        },
                      ),

                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     new MaterialPageRoute(
                        //         builder: (context) =>
                        //             DetailPage(myData[index])));
                      },
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final User user;
//   DetailPage(this.user);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user.username),
//       ),
//       body: Text(user.password),
//     );
//   }
// }

class User {
  final int id;
  final String montant;
  final String nom;
  final String postnom;
  final String prenom;

  User(this.id, this.montant, this.nom, this.postnom, this.prenom);
}
// class User {
//   final int id;
//   final String title;
//   final String url;

//   User(this.id, this.title, this.url);
// }
