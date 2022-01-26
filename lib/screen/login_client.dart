import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';
import 'package:cnss2/widget/login_form.dart';
import 'package:cnss2/widget/primary_button.dart';
import 'package:cnss2/widget/login_option.dart';
import 'package:cnss2/screen/dashboard.dart';
import 'package:cnss2/screen/dashboard1.dart';
import 'package:cnss2/screen/login.dart';

class LoginClientScreen extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: kWhiteColor,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       size: 20,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                "Welcome/ Client",
                style: titleText,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Etes-vous un administrateur? ",
                    style: subTitle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    child: Container(
                        child: Text(
                      "Connectez-vous ici",
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    )),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LogInForm(),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   "Mot de passe oublié",
              //   style: TextStyle(
              //     color: kZambeziColor,
              //     fontSize: 14,
              //     decoration: TextDecoration.underline,
              //     //decorationThickness: 1,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // MaterialButton(
              //   minWidth: double.infinity,
              //   height: 50,
              //   onPressed: () {
              //     login();
              //   },
              //   color: Palette.primaryColor,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(16)),
              //   child: Text(
              //     "Se connecter",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w600,
              //         fontSize: 18),
              //   ),
              // ),

              SizedBox(
                height: 20,
              ),
              Text("Sign in with",
                  style: subTitle.copyWith(color: kBlackColor)),
              SizedBox(
                height: 20,
              ),
              LoginOption(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         title: Text("Home"),
      //         backgroundColor: Palette.primaryColor),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         title: Text("Home"),
      //         backgroundColor: Palette.primaryColor),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.camera),
      //         title: Text("Home"),
      //         backgroundColor: Palette.primaryColor),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         title: Text("Home"),
      //         backgroundColor: Palette.primaryColor),
      //   ],
      //   onTap: (index) {
      //     // setState(() {
      //     //   _currentIndex = index;
      //     // });
      //   },
      // ),
    );
  }
}
