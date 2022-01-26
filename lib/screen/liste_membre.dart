import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cnss2/url.dart';
import 'package:cnss2/screen/draw.dart';

class ListeMembre extends StatefulWidget {
  @override
  _ListeMembreState createState() => _ListeMembreState();
}

class _ListeMembreState extends State<ListeMembre> {
  Future<List<User>> _getUsers() async {
    String url = Pub.chemin + "get_entreprise.php";
    //var data = await http.get("https://jsonplaceholder.typicode.com/photos");
    //var data = await http.get(Uri.parse(url));
    var data = await http.get(url);
    // print(data.body);

    var jsonData = json.decode(data.body);
    // print(jsonData);
    List<User> users = [];
    for (var u in jsonData) {
      print(u["CodeEntreprise"]);
      User user = User(u["CodeEntreprise"], u["DesignationEntreprise"],
          u["SiegeEntreprise"]);
      //User user = User(u["id"], u["title"], u["url"], u["thumbnailUrl"]);
      users.add(user);
    }
    print(users.length);
    print(users);

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LIST"),
      ),
      drawer: DrawScreen(),
      body: Container(
        child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // print(snapshot.data.length);
              // if (snapshot.data == null) {
              //   return Container(
              //     child: Text(
              //       "loading...",
              //     ),
              //   );
              // }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      // leading: CircleAvatar(
                      //   backgroundImage:
                      //       NetworkImage(snapshot.data[index].thumbnailUrl),
                      // ),
                      title: Text(snapshot.data[index].design),
                      subtitle: Text(snapshot.data[index].siege),
                    );
                  });
            }),
      ),
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
          //title: Text(user.title),
          ),
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
//   final String thumbnailUrl;

//   User(this.id, this.title, this.url, this.thumbnailUrl);
// }
