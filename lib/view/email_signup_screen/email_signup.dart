import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/name_create_screen/name_create.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  TextEditingController emailctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FocusNode newFocusnode = FocusNode();

  @override
  void dispose() {
    emailctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.white),
        title: Row(
          children: [
            SizedBox(width: 50),
            Text(
              "Create account",
              style: TextStyle(color: ColorConstants.white),
            ),
          ],
        ),
        backgroundColor: ColorConstants.black,
      ),
      backgroundColor: ColorConstants.black,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your email\naddress?",
              style: TextStyle(
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Form(
              key: _formkey,
              child: TextFormField(
                controller: emailctrl,
                focusNode: newFocusnode,
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
                  newFocusnode.unfocus();
                },
                validator: (value) {
                  if (value != null && value.contains("@")) {
                    return null;
                  } else {
                    return "Enter a valid email";
                  }
                },
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ColorConstants.grey),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    final email = emailctrl.text.trim();
                    final pref = await SharedPreferences.getInstance();
                    pref.setString("email", email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CreateNamePage(),
                      ),
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
    );
  }
}
