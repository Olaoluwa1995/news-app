
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 2,
      width: size.width * 0.2,
      color: Colors.grey.shade300
    );
  }
}