import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(),
    elevation: 0,
    backgroundColor: Colors.transparent,
    // actions: [
    //   IconButton(
    //       icon: Icons(icon),
    //       onPressed: () {}),
    // ],
  );
}
