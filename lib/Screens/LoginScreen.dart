import 'package:amazon_clone/Screens/SignupScreen.dart';
import 'package:amazon_clone/Widgets/Utils.dart';
import 'package:amazon_clone/resources/authentication_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.19,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/amazon_logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.48,
                    width: MediaQuery.of(context).size.width * 0.83,
                    decoration: const BoxDecoration(
                      color: Color(0xFFffffff),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.1, // soften the shadow
                          spreadRadius: 0.1, //extend the shadow
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 0, 8),
                              child: Text(
                                "Sign-In",
                                style: TextStyle(fontSize: 33),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text("Email",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.width * 0.69,
                          child: TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is Required";
                              }
                            },
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.055,
                            width: MediaQuery.of(context).size.width * 0.69,
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is Required";
                                }
                              },
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange))),
                            )),
                        const SizedBox(
                          height: 45,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                              onPressed: () async {
                                String output =
                                    await authenticationMethods.LoginUser(
                                        email: emailcontroller.text.toString(),
                                        password:
                                            passwordcontroller.text.toString());
                                if (output == "Success") {
                                  //functions
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                  //error
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  primary: Colors.yellow),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.30,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "New to Amazon?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          primary: Colors.grey),
                      child: const Text(
                        "Create Your Amazon Account",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
