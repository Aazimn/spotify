import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/password_signup_screen/password_signup.dart';

class CreateNamePage extends StatefulWidget {
  const CreateNamePage({super.key});

  @override
  State<CreateNamePage> createState() => _CreateNamePageState();
}

class _CreateNamePageState extends State<CreateNamePage> {
  final TextEditingController _nameController = TextEditingController();
  bool preferNoMarketing = false;
  bool shareRegistration = false;
  bool isValidName = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateConditions);
  }

  void _validateConditions() {
    final name = _nameController.text.trim();
    setState(() {
      isValidName = name.length > 2;
    });
  }

  bool get isButtonEnabled =>
      isValidName && preferNoMarketing && shareRegistration;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF0B0B0B);
    const fieldBorder = Color(0xFF3A3A3A);
    const dimText = Color(0xFF9A9A9A);
    const linkGreen = Color(0xFF00C853);
    const pagePadding = 20.0;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        centerTitle: true,
        title: const Text(
          'Create account',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorConstants.white,
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        child: SizedBox(
          height: 70,
          child: Center(
            child: SizedBox(
              width: 240,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () async {
                      final name = _nameController.text.trim();
                    final pref = await SharedPreferences.getInstance();
                    pref.setString("Name", name);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Password(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled
                      ? Colors.white
                      : ColorConstants.white,
                  elevation: isButtonEnabled ? 6 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: isButtonEnabled ? Colors.black : Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: pagePadding,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                "What's your name?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.02,
                ),
              ),
              const SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: fieldBorder, width: 1.6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 4,
                    ),
                  ),
                ),
              ),

              if (!isValidName && _nameController.text.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    "Name must be at least 3 characters",
                    style: TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 8),
              const Text(
                "This appears on your Spotify profile.",
                style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 12),
              ),

              const SizedBox(height: 22),
              const Divider(color: Color(0xFF1F1F1F), height: 1, thickness: 1),
              const SizedBox(height: 16),
              Text(
                "Spotify is a personalized service.",
                style: TextStyle(color: dimText, fontSize: 13),
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: dimText, fontSize: 13),
                  children: [
                    const TextSpan(
                      text:
                          'By tapping "Create account", you agree to the Spotify Terms of Use. ',
                    ),
                    TextSpan(
                      text: 'Terms of Use',
                      style: const TextStyle(
                        color: linkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: dimText, fontSize: 13),
                  children: [
                    const TextSpan(
                      text:
                          'By tapping "Create account", you confirm that you have read how we process your personal data in our Privacy Policy. ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        color: linkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'I would prefer not to receive marketing messages from Spotify.',
                      style: TextStyle(color: dimText, fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        preferNoMarketing = !preferNoMarketing;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF6A6A6A),
                          width: 2,
                        ),
                        color: preferNoMarketing
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: preferNoMarketing
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.black,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Share my registration data with Spotify’s content providers for marketing purposes.",
                      style: TextStyle(color: dimText, fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        shareRegistration = !shareRegistration;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF6A6A6A),
                          width: 2,
                        ),
                        color: shareRegistration
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: shareRegistration
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.black,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
