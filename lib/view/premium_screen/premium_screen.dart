import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstants.black,
                image: DecorationImage(
                  image: AssetImage(ImageConstants.premiumBG),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, Colors.black54, Colors.black45],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 200),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: ColorConstants.black,
                            backgroundImage: AssetImage(
                              ImageConstants.logoWhite,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Premium",
                            style: TextStyle(
                              color: ColorConstants.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Listen without limits. Try\n4 months of Premium\nIndividual for free",
                        style: TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: ColorConstants.signUpTextfield,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.blue,
                        size: 35,
                      ),
                      Text(
                        "Limited time offer",
                        style: TextStyle(
                          color: ColorConstants.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "You can't upgrade to premium in the app. we know,it's not ideal.",
                style: TextStyle(color: ColorConstants.grey, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstants.signUpTextfield,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Why join Premium?",
                            style: TextStyle(
                              color: ColorConstants.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Divider(
                            color: const Color.fromARGB(255, 74, 73, 73),
                            thickness: 0,
                            height: 30,
                          ),

                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.speakerX(),
                                color: ColorConstants.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Ad-free music listening",
                                style: TextStyle(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.downloadSimple(),
                                color: ColorConstants.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Download to listen offline",
                                style: TextStyle(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.shuffle(),
                                color: ColorConstants.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Play songs in any order",
                                style: TextStyle(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.headphones(),
                                color: ColorConstants.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "High audio quality",
                                style: TextStyle(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.usersThree(),
                                color: ColorConstants.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Listen with friends in real time",
                                style: TextStyle(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.playlist(),
                                color: ColorConstants.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "organize listening queue",
                                style: TextStyle(
                                  color: ColorConstants.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Available plans",
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _premium(
                    width: 150,
                    color: ColorConstants.p1,
                    text1: 'Free for 4 months',
                    text2: 'Individual',
                    text3:
                        ' · 1 Premium account\n · Cancel anytime\n · Subscribe or one_time payment',
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  _premium(
                    width: 130,
                    color: ColorConstants.p2,
                    text1: '2 months offer',
                    text2: 'Student',
                    text3:
                        ' · 1 verified Premium account\n · Discount for eligible students\n · Cancel anytime\n · Subscribe or one_time payment',
                    height: 330,
                  ),
                  SizedBox(height: 20),
                  _premium(
                    width: 130,
                    color: ColorConstants.p3,
                    text1: '2 months offer',
                    text2: 'Duo',
                    text3:
                        ' · 2 Premium account\n · Cancel anytime\n · Subscribe or one-time payment',
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  _premium(
                    width: 130,
                    color: ColorConstants.p4,
                    text1: '2 months offer',
                    text2: 'Family',
                    text3:
                        ' · Upto 6 Premium account\n · Control content marked as explicit\n · Cancel anytime\n · Subscribe or one_time payment',
                    height: 330,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _premium({
    required double width,
    required Color color,
    required String text1,
    required String text2,
    required String text3,
    required double height,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstants.signUpTextfield,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width,
                height: 45,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    text1,
                    style: TextStyle(
                      color: ColorConstants.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorConstants.black,
                      backgroundImage: AssetImage(ImageConstants.logoWhite),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Premium",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  text2,
                  style: TextStyle(
                    color: color,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  text3,
                  style: TextStyle(color: ColorConstants.white, fontSize: 20),
                ),
                SizedBox(height: 15),
                Text(
                  "You can't upgrade to premium in the app. We know,it's not ideal.",
                  style: TextStyle(color: ColorConstants.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//·
