import 'package:flutter/material.dart';
import 'package:cnss2/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String buttontext;
  PrimaryButton({@required this.buttontext});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: kPrimaryColor),
      child: Text(
        buttontext,
        style: textButton.copyWith(color: kWhiteColor),
      ),
    );
  }
}
