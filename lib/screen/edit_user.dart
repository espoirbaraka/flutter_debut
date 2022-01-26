import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cnss2/screen/list_user.dart';
import 'package:cnss2/config/palette.dart';
import 'package:cnss2/screen/bottom_nav_screen.dart';
import 'package:cnss2/url.dart';

class AddEditPage extends StatefulWidget {
  final User list;
  final int index;
  AddEditPage({this.list, this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController username = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      String url = Pub.chemin + "edit_user.php";
      http.post(url, body: {
        'id': widget.list.id.toString(),
        'username': username.text,
        'password': password.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      username.text = widget.list.username;
      id.text = widget.list.id.toString();
      password.text = widget.list.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text(editMode ? 'Update' : 'Add Data'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  addUpdateData();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavScreen(),
                  ),
                );
                debugPrint('Clicked RaisedButton Button');
              },
              color: Palette.primaryColor,
              child: Text(
                editMode ? 'Update' : 'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
