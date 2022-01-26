import 'package:flutter/material.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/styles.dart';
import 'package:cnss2/data/data.dart';
import 'package:cnss2/widget/widget.dart';
import 'package:cnss2/widget/insert_form_membre.dart';
import 'package:cnss2/screen/login.dart';
import 'package:cnss2/screen/liste_entreprise.dart';
//import 'package:cnss2/screen/list_user.dart';
// import 'package:cnss2/screen/profile_membre.dart';
import 'package:cnss2/screen/draw.dart';
import 'package:cnss2/url.dart';
import 'package:http/http.dart' as http;

class InsertMembre extends StatefulWidget {
  final User liste;
  final int index;
  InsertMembre({this.liste, this.index});
  @override
  _InsertMembreState createState() => _InsertMembreState();
}

class _InsertMembreState extends State<InsertMembre> {
  TextEditingController id = TextEditingController();
  TextEditingController design = TextEditingController();
  TextEditingController siege = TextEditingController();
  TextEditingController txtnom = new TextEditingController();
  TextEditingController txtpostnom = new TextEditingController();
  TextEditingController txtprenom = new TextEditingController();
  TextEditingController txtlieunaiss = new TextEditingController();
  TextEditingController txtdatenaiss = new TextEditingController();
  TextEditingController txtadresse = new TextEditingController();
  TextEditingController txtsalaire = new TextEditingController();
  TextEditingController txtnomconjoint = new TextEditingController();
  TextEditingController txtpostnomconjoint = new TextEditingController();

  Future<void> Enregistrement() async {
    if (txtnom.text != '' || txtpostnom.text != '' || txtprenom.text != '') {
      String url = Pub.chemin + "add_membre.php";
      var reponse = await http.post(Uri.parse(url), body: {
        "nom": txtnom.text,
        "postnom": txtpostnom.text,
        "prenom": txtprenom.text,
        "lieunaiss": txtlieunaiss.text,
        "salaire": txtsalaire.text,
        "nomconjoint": txtnomconjoint.text,
        "postnomconjoint": txtpostnomconjoint.text,
        "code": widget.liste.id.toString(),
        //"code": design.text,
      });
      print(reponse);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      design.text = widget.liste.design;
      id.text = widget.liste.id.toString();
      siege.text = widget.liste.siege;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawScreen(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _space(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _space(double screenHeight) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 25,
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Ajouter un membre a ' + design.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //padding: EdgeInsets.all(30),
            TextFormField(
              controller: txtnom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Nom de l\'agent', icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: txtpostnom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Postnom de l\'agent', icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: txtprenom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Prenom de l\'agent', icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: txtlieunaiss,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Lieu de naissance', icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: txtsalaire,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Salaire', icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: txtnomconjoint,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Nom du conjoint', icon: Icon(Icons.person)),
            ),
            TextFormField(
              controller: txtpostnomconjoint,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Postnom du conjoint', icon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              onPressed: () {
                Enregistrement();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListeEntreprise(),
                  ),
                );
              },
              color: Palette.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                "Inscription",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
    // actions: [
    //   FlatButton(
    //     child: Text("Yes"),
    //     onPressed: () {
    //       addPartage();
    //       _clearValues();
    //       getdata();
    //     },
    //   ),
    // ],
    //         );
    //       },
    //       );
  }
}
