import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.bgColor,
    required this.iconColor,
    required this.textColor,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Color bgColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.488,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, 
              size: 35,
              color: iconColor,
            ),
            SizedBox(
              width: size.width * 0.03
            ),
            Text(text, 
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold
              )
            )
          ],
        ),
      ),
    );
  }
}