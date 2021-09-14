import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onpressed;

  CustomButton(
      {required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xFF00BFFF).withOpacity(0.5),
      ),
      child: MaterialButton(
        elevation: 0,
        height: size.height * 0.05,
        minWidth:
            MediaQuery.of(context).size.width * 0.4,
        splashColor: Colors.white10,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
