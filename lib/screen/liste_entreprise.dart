import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cnss2/url.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/screen/profile_membre.dart';
import 'package:cnss2/screen/insert_membre.dart';
import 'package:cnss2/screen/draw.dart';

class ListeEntreprise extends StatefulWidget {
  @override
  _ListeEntrepriseState createState() => _ListeEntrepriseState();
}

class _ListeEntrepriseState extends State<ListeEntreprise> {
  bool _isLoading = false;
  final UrlImage = "assets/job.jpg";
  List<User> myData;
  Future<List<User>> _getUsers() async {
    setState(() {
      _isLoading = true;
    });
    String url = Pub.chemin + "get_entreprise.php";
    var data = await http.get(url);
    //print(data.body);
    var jsonData = json.decode(data.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(int.parse(u["CodeEntreprise"]),
          u["DesignationEntreprise"], u["SiegeEntreprise"]);
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
        title: new Text("LISTE D'ENTREPRISE"),
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
                        myData[index].design,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Siège: " + myData[index].siege),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InsertMembre(
                                  liste: myData[index],
                                  index: index,
                                ),
                          ),
                        );
                        debugPrint('Edit Clicked');
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
        title: Text(user.design),
      ),
      body: Text(user.design),
    );
  }
}

class User {
  final int id;
  final String design;
  final String siege;

  User(this.id, this.design, this.siege);
}
// class User {
//   final int id;
//   final String title;
//   final String url;

//   User(this.id, this.title, this.url);
// }
