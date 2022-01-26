import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';
import 'package:cnss2/widget/register_form.dart';
import 'package:cnss2/widget/primary_button.dart';
import 'package:cnss2/widget/login_option.dart';

class RegisterScreen extends StatelessWidget {
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
                height: 50,
              ),
              Text(
                "Enregistrez-vous",
                style: titleText,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Avez-vous un compte? ",
                    style: subTitle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Connectez-vous",
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RegisterForm(),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                buttontext: "S'inscrire",
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.only(top: 100),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fitHeight),
                ),
              )
              // Text("Sign in with",
              //     style: subTitle.copyWith(color: kBlackColor)),
              // SizedBox(
              //   height: 20,
              // ),
              // LoginOption(),
            ],
          ),
        ),
      ),
    );
  }
}
