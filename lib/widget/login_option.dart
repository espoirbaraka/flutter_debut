import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildButton(
          iconImage: Image(
              height: 20, width: 20, image: AssetImage("assets/facebook.png")),
          textButton: ' Facebook',
        ),
        BuildButton(
          iconImage: Image(
              height: 20, width: 20, image: AssetImage("assets/google.png")),
          textButton: ' Gmail',
        ),
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  final Image iconImage;
  final String textButton;
  BuildButton({@required this.iconImage, @required this.textButton});
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
        height: mediaquery.height * 0.06,
        width: mediaquery.width * 0.36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconImage,
            SizedBox(
              height: 5,
            ),
            Text(textButton)
          ],
        ));
  }
}
