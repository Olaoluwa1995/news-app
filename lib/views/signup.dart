import 'package:flutter/material.dart';
import 'package:news_app/constants/widgets/custom-button.dart';
import 'package:news_app/constants/widgets/custom-input.dart';
import 'package:news_app/views/widgets/auth_layout.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    final _registerFormKey = GlobalKey<FormState>();

  Map<String, dynamic> _registerData = {
    'username': '',
    'email': '',
    'password': '',
    'passwordConf': '',
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

  String? _nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter name';
    }
    return null;
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
            key: _registerFormKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  hint: 'Dion',
                  label: 'Username',
                  onSaved: (value) {
                    _registerData['username'] = value!;
                  },
                  validator: _nameValidator,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomInput(
                  hint: 'example@gmail.com',
                  label: 'Email',
                  validator: _emailValidator,
                  onSaved: (value) {
                    _registerData['email'] = value!;
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
                    _registerData['password'] = value!;
                  },
                  validator: _passwordValidator,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomInput(
                  obsecure: true,
                  hint: '*********',
                  label: 'Confirm Password',
                  onSaved: (value) {
                    _registerData['passwordConf'] = value!;
                  },
                  validator: _passwordValidator,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomButton(
                  text: 'Sign Up',
                  onpressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      text: 'Or Sign Up With', 
      bottomRow: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Have an account?'),
          SizedBox(
            width: size.width * 0.01,
          ),
          GestureDetector(
            onTap: () {},
            child: Text('Sign in', style: TextStyle(
              color: Colors.orange
            ),),
          )
        ],
      ),
      title: 'Sign Up',
    );
  }
}