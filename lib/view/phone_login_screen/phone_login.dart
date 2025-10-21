import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/dashbord/dashboard.dart';
import 'package:spotify/view/home_screen/home_screen.dart';
import 'package:spotify/view/otp_screen/otp_screen.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  TextEditingController phonectrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FocusNode newFocusnode = FocusNode();
  String? country;
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
                "Enter phone number",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                color: const Color.fromARGB(255, 67, 67, 67),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    focusColor: Colors.red,
                    isExpanded: true,
                    iconSize: 50,
                    style: TextStyle(color: ColorConstants.black),
                    value: country,
                    items: [
                      DropdownMenuItem(value: "India", child: Text("India")),
                      DropdownMenuItem(value: "Usa", child: Text("Usa")),
                      DropdownMenuItem(value: "Uk", child: Text("Uk")),
                      DropdownMenuItem(value: "Canada", child: Text("Canada")),
                    ],
                    selectedItemBuilder: (context) {
                      return [
                        Text(
                          "India",
                          style: TextStyle(color: ColorConstants.white),
                        ),
                        Text(
                          "Usa",
                          style: TextStyle(color: ColorConstants.white),
                        ),
                        Text(
                          "Uk",
                          style: TextStyle(color: ColorConstants.white),
                        ),
                        Text(
                          "Canada",
                          style: TextStyle(color: ColorConstants.white),
                        ),
                      ];
                    },
                    onChanged: (value) {
                      country = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value != null) {
                        return null;
                      } else {
                        return "Select a Country";
                      }
                    },
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: const Color.fromARGB(255, 92, 90, 90),
                      ),
                      color: const Color.fromARGB(255, 67, 67, 67),
                    ),
                    height: 56,
                    width: 50,
                    child: Center(
                      child: Text(
                        "+91",
                        style: TextStyle(color: ColorConstants.white),
                      ),
                    ),
                  ),

                  Container(
                    width: 312,
                    child: TextFormField(
                      controller: phonectrl,
                      focusNode: newFocusnode,
                      style: TextStyle(color: ColorConstants.white),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        errorMaxLines: 1,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 67, 67, 67),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.white),
                        ),
                        hoverColor: ColorConstants.white,
                      ),
                      onTapOutside: (event) {
                        newFocusnode.unfocus();
                      },
                      validator: (value) {
                        if (value != null &&
                            RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return null;
                        } else {
                          return "Enter a valid Phone Number";
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "We may occusionally send you services_based messages",
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
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final number = phonectrl.text.trim();
                      final pref = await SharedPreferences.getInstance();
                      pref.setString("Phone", number);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
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
