import 'package:chat_app_new/pages/register_page.dart';
import 'package:chat_app_new/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CHAT APP',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Login now to See what they are Talking",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Image.asset(
                  "images/login.png",
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onChanged: (val) {
                    email = val;
                  },
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please Enter Valid Email";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.password,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  validator: (val) {
                    if (val!.length < 8) {
                      return 'Password must be at least 8 character';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    password = val;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: "Don't have account?  ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register here",
                        style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          nextScreen(context,const RegisterPage());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
