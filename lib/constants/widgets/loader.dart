import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black12,
      child: Padding(
       padding: EdgeInsets.symmetric(horizontal: size.width * 0.435, vertical: size.height * 0.45),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
