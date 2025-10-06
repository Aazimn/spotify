import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/choose_artist_screen/choose_artist.dart';

class GenderSignup extends StatefulWidget {
  const GenderSignup({super.key});

  @override
  State<GenderSignup> createState() => _GenderSignupState();
}

class _GenderSignupState extends State<GenderSignup> {
  final _formkey = GlobalKey<FormState>();
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.black),
      backgroundColor: ColorConstants.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your gender?",
              style: TextStyle(
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              color: const Color.fromARGB(255, 67, 67, 67),
              child: Form(
                key: _formkey,
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  focusColor: Colors.red,
                  isExpanded: true,
                  iconSize: 50,
                  style: TextStyle(color: ColorConstants.black),
                  value: gender,
                  items: [
                    DropdownMenuItem(value: "Male", child: Text("Male")),
                    DropdownMenuItem(value: "Female", child: Text("Female")),
                    DropdownMenuItem(value: "Others", child: Text("Others")),
                  ],
                  selectedItemBuilder: (context) {
                    return [
                      Text(
                        "Male",
                        style: TextStyle(color: ColorConstants.white),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: ColorConstants.white),
                      ),
                      Text(
                        "Others",
                        style: TextStyle(color: ColorConstants.white),
                      ),
                    ];
                  },
                  onChanged: (value) {
                    gender = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value != null) {
                      return null;
                    } else {
                      return "Select a gender";
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ColorConstants.grey),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseArtist()),
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
