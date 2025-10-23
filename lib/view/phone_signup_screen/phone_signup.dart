import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/otp_sign_screen/otp_sign.dart';

class PhoneSignup extends StatefulWidget {
  const PhoneSignup({super.key});

  @override
  State<PhoneSignup> createState() => _PhoneSignupState();
}

class _PhoneSignupState extends State<PhoneSignup> {
  final TextEditingController phonectrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FocusNode newFocusnode = FocusNode();

  String? country;
  String countryCode = ""; 

  final Map<String, String> countryCodes = {
    "India": "+91",
    "USA": "+1",
    "UK": "+44",
    "Canada": "+1",
  };

  @override
  void dispose() {
    phonectrl.dispose();
    newFocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.white),
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
              ),
              const SizedBox(height: 20),

         
              Container(
                height: 60,
                color: const Color.fromARGB(255, 67, 67, 67),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonFormField<String>(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    isExpanded: true,
                    dropdownColor: const Color.fromARGB(255, 67, 67, 67),
                    iconSize: 40,
                    value: country,
                    hint: const Text(
                      "Select Country",
                      style: TextStyle(color: Colors.white54),
                    ),
                    items: countryCodes.keys
                        .map((c) => DropdownMenuItem(
                              value: c,
                              child: Text(c),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        country = value;
                        countryCode = countryCodes[value!]!;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    validator: (value) =>
                        value == null ? "Select a Country" : null,
                  ),
                ),
              ),

              const SizedBox(height: 10),

            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 92, 90, 90),
                      ),
                      color: const Color.fromARGB(255, 67, 67, 67),
                    ),
                    height: 56,
                    width: 70,
                    child: Center(
                      child: Text(
                        countryCode,
                        style: TextStyle(color: ColorConstants.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      controller: phonectrl,
                      focusNode: newFocusnode,
                      style: TextStyle(color: ColorConstants.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(height: 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 67, 67, 67),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.white),
                        ),
                      ),
                      onTapOutside: (event) => newFocusnode.unfocus(),
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

              const SizedBox(height: 5),
              Text(
                "We may occasionally send you service-based messages",
                style: TextStyle(color: ColorConstants.white, fontSize: 13),
              ),
              const SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.grey),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final number = "$countryCode${phonectrl.text.trim()}";
                      final pref = await SharedPreferences.getInstance();
                      pref.setString("Phone_s_key", number);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreensign(),
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
      ),
    );
  }
}
