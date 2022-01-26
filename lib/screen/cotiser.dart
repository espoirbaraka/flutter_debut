import 'package:flutter/material.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/styles.dart';
import 'package:cnss2/data/data.dart';
import 'package:cnss2/widget/widget.dart';
import 'package:cnss2/widget/insert_form_membre.dart';
import 'package:cnss2/screen/login.dart';
import 'package:cnss2/screen/list_membre.dart';
import 'package:cnss2/screen/draw.dart';
//import 'package:cnss2/screen/list_user.dart';
// import 'package:cnss2/screen/profile_membre.dart';
//import 'package:cnss2/screen/liste_entreprise.dart';
import 'package:cnss2/url.dart';
import 'package:http/http.dart' as http;

class Cotiser extends StatefulWidget {
  final User liste;
  final int index;
  Cotiser({this.liste, this.index});
  @override
  _CotiserState createState() => _CotiserState();
}

class _CotiserState extends State<Cotiser> {
  TextEditingController id = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController txtmontant = new TextEditingController();
  TextEditingController txtpostnom = new TextEditingController();
  TextEditingController txtprenom = new TextEditingController();
  TextEditingController txtlieunaiss = new TextEditingController();
  TextEditingController txtdatenaiss = new TextEditingController();
  TextEditingController txtadresse = new TextEditingController();
  TextEditingController txtsalaire = new TextEditingController();
  TextEditingController txtnomconjoint = new TextEditingController();
  TextEditingController txtpostnomconjoint = new TextEditingController();

  Future<void> Enregistrement() async {
    if (txtmontant != '') {
      String url = Pub.chemin + "cotiser_montant.php";
      var reponse = await http.post(Uri.parse(url), body: {
        "montant": txtmontant.text,
        "membre": widget.liste.id.toString(),
        //"code": design.text,
      });
      print(reponse);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      nom.text = widget.liste.nom;
      id.text = widget.liste.id.toString();
      postnom.text = widget.liste.postnom;
      prenom.text = widget.liste.prenom;
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
                  'Effectuer la cotisation de ' + nom.text,
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
              controller: txtmontant,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Montant', icon: Icon(Icons.attach_money)),
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
                    builder: (context) => ListeMembre(),
                  ),
                );
              },
              color: Palette.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                "Cotiser",
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
