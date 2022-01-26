import 'package:flutter/material.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/styles.dart';
import 'package:cnss2/data/data.dart';
import 'package:cnss2/widget/widget.dart';
import 'package:cnss2/widget/insert_form_user.dart';
import 'package:cnss2/screen/login.dart';
import 'package:cnss2/screen/liste_entreprise.dart';
import 'package:cnss2/screen/list_user.dart';
import 'package:cnss2/screen/profile_membre.dart';
import 'package:cnss2/screen/draw.dart';

class InsertUser extends StatefulWidget {
  @override
  _InsertUserState createState() => _InsertUserState();
}

class _InsertUserState extends State<InsertUser> {
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
                  'Ajouter une utilisateur',
                  textAlign: TextAlign.center,
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
        child: //padding: kDefaultPadding,
            FormUtilisateur());
  }
}
