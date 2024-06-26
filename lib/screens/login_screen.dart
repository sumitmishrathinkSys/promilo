import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:promilo/app_widgets/custom_button.dart';
import 'package:promilo/app_widgets/custom_text_field.dart';
import 'package:promilo/app_widgets/social_media_widget.dart';
import 'package:promilo/main.dart';
import 'package:promilo/repository/user_repository.dart';
import 'package:promilo/utils/image_constant.dart';
import 'package:promilo/utils/text_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final UserRepository _userRepository = UserRepository();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await _userRepository.login(
        _emailController.text, _passwordController.text);

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(TextConstant.token, response.body);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(TextConstant.invalidIdPassword)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextConstant.promilo,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  TextConstant.welcomeBack,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            TextConstant.signInToContinue,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: TextConstant.enterEmail,
                  labelText: TextConstant.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return TextConstant.enterYourEmail;
                    }
                    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!regex.hasMatch(value)) {
                      return TextConstant.enterValidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text("Sign in With OTP",textAlign: TextAlign.end,textDirection: TextDirection.rtl,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          TextConstant.signInWithOtp,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            TextConstant.password,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Text("Password"),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: TextConstant.enterPassword,
                  labelText: TextConstant.password,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return TextConstant.enterYourPassword;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Handle forgot password action
                          },
                          child: Text(
                            TextConstant.forgotPassword,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: TextConstant.submit,
                  onPressed: _login,
                  isLoading: _isLoading,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Divider(color: Colors.grey,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        // thickness: 1,
                      ),
                    ),
                    const Text(
                      " or ",
                      style: TextStyle(fontSize: 18),
                    ),
                   SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        // thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaWidget(path: ImageConstants.googleIcon),
                    SocialMediaWidget(path: ImageConstants.linkedinIcon),
                    SocialMediaWidget(path: ImageConstants.facebookIcon),
                    SocialMediaWidget(path: ImageConstants.instagramIcon),
                    SocialMediaWidget(path: ImageConstants.whatsappIcon),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business User?",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login Here",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  TextConstant.byContinuing,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TextConstant.promilos,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    Text(
                      TextConstant.termsAndPrivacyPolicy,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
