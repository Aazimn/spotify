import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/gender_signup_screen/gender_signup.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController passctrl = TextEditingController();
  TextEditingController confirmctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FocusNode passfocus = FocusNode();
  FocusNode confirmfocus = FocusNode();

  bool _isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.black),
      backgroundColor: ColorConstants.black,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create password",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: _isobscure,
                controller: passctrl,
                focusNode: passfocus,
                style: TextStyle(color: ColorConstants.white),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: ColorConstants.grey),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: ColorConstants.signUpTextfield,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.white),
                  ),
                  hoverColor: ColorConstants.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isobscure ? Icons.visibility_off : Icons.visibility,
                      color: ColorConstants.white,
                    ),
                    onPressed: () {
                      _isobscure = !_isobscure;
                      setState(() {});
                    },
                  ),
                ),
                onTapOutside: (event) {
                  passfocus.unfocus();
                },
                validator: (value) => validatepass(value),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _isobscure,
                controller: confirmctrl,
                focusNode: confirmfocus,
                style: TextStyle(color: ColorConstants.white),
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: ColorConstants.grey),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: ColorConstants.signUpTextfield,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.white),
                  ),
                  hoverColor: ColorConstants.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isobscure ? Icons.visibility_off : Icons.visibility,
                      color: ColorConstants.white,
                    ),
                    onPressed: () {
                      _isobscure = !_isobscure;
                      setState(() {});
                    },
                  ),
                ),
                onTapOutside: (event) {
                  confirmfocus.unfocus();
                },
                validator: (value) {
                  if (password == value) {
                    return null;
                  } else {
                    return "Password don't match";
                  }
                },
              ),
              SizedBox(height: 5),
              Text(
                "Enter a strong password",
                style: TextStyle(color: ColorConstants.white),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      ColorConstants.grey,
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GenderSignup()),
                      );
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: ColorConstants.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? password;
String? validatepass(String? value) {
  password = value;
  RegExp capital = RegExp(r'^(?=.*[A-Z]).+$');
  RegExp small = RegExp(r'^(?=.*[a-z]).+$');
  RegExp number = RegExp(r'^(?=.*[0-9]).+$');
  RegExp special = RegExp(r'^(?=.*[@#$%&*]).+$');

  if (value!.isEmpty) {
    return "please enter password";
  } else if (value.length < 8) {
    return "Minimum 8 letters needed";
  } else if (!capital.hasMatch(value)) {
    return "Must have Upper case";
  } else if (!small.hasMatch(value)) {
    return "Must have Lower case";
  } else if (!number.hasMatch(value)) {
    return "Must have number";
  } else if (!special.hasMatch(value)) {
    return "Must have special char";
  } else {
    return null;
  }
}
