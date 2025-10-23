import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/dashbord/dashboard.dart';


class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  TextEditingController passctrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  bool _isobscure = true;

@override
  void dispose() {
    passFocus.dispose();
    passctrl.dispose();
    emailFocus.dispose();
    emailctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in",
          style: TextStyle(
            color: ColorConstants.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorConstants.black,
      ),
      backgroundColor: ColorConstants.black,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email or username",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: emailctrl,
                focusNode: emailFocus,
                style: TextStyle(color: ColorConstants.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: ColorConstants.signUpTextfield,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.white),
                  ),
                  hoverColor: ColorConstants.white,
                ),
                onTapOutside: (event) {
                  emailFocus.unfocus();
                },
                validator: (value) {
                  if (value != null && value.contains("@gmail.com")) {
                    return null;
                  } else {
                    return "Enter a valid email";
                  }
                },
              ),
              SizedBox(height: 30),
              Text(
                "Password",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5),
              TextFormField(
                obscureText: _isobscure,
                controller: passctrl,
                focusNode: passFocus,
                style: TextStyle(color: ColorConstants.white),
                decoration: InputDecoration(
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
                  passFocus.unfocus();
                },
                validator: (value) => validatepass(value),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      ColorConstants.grey,
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final email = emailctrl.text.trim();
                      final password = passctrl.text.trim();
                      final pref = await SharedPreferences.getInstance();
                      pref.setString("email", email);
                      pref.setString("password", password);

                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                    }
                  },
                  child: Text(
                    "Log in",
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

String? validatepass(String? value) {
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
