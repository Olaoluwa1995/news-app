import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constants/app-api.dart';
import 'package:news_app/constants/app-routes.dart';
import 'package:news_app/constants/widgets/custom-button.dart';
import 'package:news_app/constants/widgets/custom-input.dart';
import 'package:news_app/constants/widgets/error.dart';
import 'package:news_app/constants/widgets/loader.dart';
import 'package:news_app/views/widgets/auth_layout.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
    final _loginFormKey = GlobalKey<FormState>();

  Map<String, dynamic> _loginData = {
    'email': '',
    'password': '',
  };

  String? _emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter email';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? _passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

   void _showLoader() {
    showDialog(
      context: context,
      builder: (ctx) => Loader(),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => GestureDetector(
        child: ErrorView(message),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> _login () async {
    if (!_loginFormKey.currentState!.validate()) {
      // Invalid !
      return;
    }
    _loginFormKey.currentState!.save();
    print(_loginData);
    _showLoader();
    http.Response response = await http.post(
    Uri.parse('${AppApi.signinUrl}'),
    body: json.encode(_loginData),
    headers: {'Content-Type': 'application/json'},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    if(responseData.containsValue("Success!")) {
      Navigator.of(context).pop();
      print('true');
      // Navigator.of(context).pushReplacementNamed(routeName);
    } else {
      Navigator.of(context).pop();
      _showErrorDialog(responseData['Success']);
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AuthLayout(
      form: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.05,
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: _loginFormKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  hint: 'example@gmail.com',
                  label: 'Email',
                  validator: _emailValidator,
                  onSaved: (value) {
                    _loginData['email'] = value!;
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomInput(
                  obsecure: true,
                  hint: '*********',
                  label: 'Password',
                  onSaved: (value) {
                    _loginData['password'] = value!;
                  },
                  validator: _passwordValidator,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.05,
                      top: size.height * 0.015,
                      bottom: size.height * 0.02,
                    ),
                    child: Text('Forgot Password?', style: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline,
                      color: Colors.blue.shade900,
                    )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomButton(
                  text: 'Sign In',
                  onpressed: _login,
                ),
              ],
            ),
          ),
        ),
      ),
      text: 'Or Sign In With', 
      bottomRow: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?'),
          SizedBox(
            width: size.width * 0.01,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(Routes.SIGN_UP_SCREEN_ROUTE),
            child: Text('Sign Up', style: TextStyle(
              color: Colors.orange
            ),),
          )
        ],
      ),
      title: 'Sign In',
    );
  }
}