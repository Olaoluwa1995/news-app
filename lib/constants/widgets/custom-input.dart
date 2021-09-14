import 'package:flutter/material.dart';
import 'package:news_app/constants/app-colors.dart';
import '../app-input.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final bool obsecure;
  final void Function(String?)? onSaved;
  final dynamic validator;

  CustomInput({
    this.hint,
    this.label,
    this.obsecure = false,
    required this.onSaved,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              obscureText: obsecure,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05),
                errorMaxLines: 1,
                hintText: hint,
                hintStyle: TextStyle(
                    color: Colors.black54, fontSize: 12),
                errorBorder: AppInput.errorBorder,
                errorStyle: AppInput.errorStyle,
                counterText: '',
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                focusedErrorBorder: AppInput.focusedBorder,
                filled: true,
                fillColor: Colors.brown.shade200,
                focusedBorder: AppInput.focusedBorder,
                border: AppInput.border,
              ),
              validator: validator,
              onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }
}
